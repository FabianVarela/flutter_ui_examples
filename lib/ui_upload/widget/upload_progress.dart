import 'package:flutter/material.dart';

enum ProgressStyle { stepper, bar }

enum ProcessStatus { success, error, loading, none }

enum ProcessStep { upload, verification, converting, download }

const _kSuccessColor = Color(0xFF4CAF50);
const _kErrorColor = Color(0xFFE53935);

const _kCircleSize = 24.0;
const _kConnectorGap = 16.0;

class UploadProgressWidget extends StatelessWidget {
  const UploadProgressWidget({
    required this.progress,
    required this.currentStep,
    this.style = .stepper,
    this.errorStep,
    this.errorMessage,
    super.key,
  });

  final double progress;
  final ProcessStep currentStep;
  final ProgressStyle style;
  final ProcessStep? errorStep;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      clipBehavior: .antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      child: Padding(
        padding: const .all(16),
        child: Column(
          spacing: 32,
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: <Widget>[
            Column(
              spacing: 8,
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: <Widget>[
                _UploadTitle(progress: progress, errorStep: errorStep),
                if (errorStep != null && errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(color: _kErrorColor),
                  ),
              ],
            ),
            switch (style) {
              .stepper => _UploadStepper(
                progress: progress,
                currentStep: currentStep,
                errorStep: errorStep,
              ),
              .bar => _UploadLinear(
                progress: progress,
                currentStep: currentStep,
                errorStep: errorStep,
                errorMessage: errorMessage,
              ),
            },
          ],
        ),
      ),
    );
  }
}

class _UploadTitle extends StatelessWidget {
  const _UploadTitle({required this.progress, this.errorStep});

  final double progress;
  final ProcessStep? errorStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: <Widget>[
        Text(
          errorStep != null ? 'Error!' : 'Processing...',
          style: TextStyle(
            fontSize: 20,
            fontWeight: .w600,
            color: errorStep != null ? _kErrorColor : Colors.grey[800],
          ),
        ),
        if (errorStep == null)
          Text(
            '${(progress * 100).toInt()}%',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: .bold,
              color: _kSuccessColor,
            ),
          )
        else
          const Icon(Icons.error, color: _kErrorColor),
      ],
    );
  }
}

class _UploadStepper extends StatelessWidget {
  const _UploadStepper({
    required this.progress,
    required this.currentStep,
    this.errorStep,
  });

  final double progress;
  final ProcessStep currentStep;
  final ProcessStep? errorStep;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final stepWidth = constraints.maxWidth / ProcessStep.values.length;
        return SizedBox(
          height: 80,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: _kCircleSize / 2 - 1,
                left: stepWidth / 2,
                right: stepWidth / 2,
                child: Row(
                  children: <Widget>[
                    for (int i = 0; i < ProcessStep.values.length - 1; i++)
                      Expanded(
                        child: Padding(
                          padding: const .symmetric(horizontal: _kConnectorGap),
                          child: Container(height: 2, color: _connectColor(i)),
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  for (final step in ProcessStep.values)
                    SizedBox(
                      width: stepWidth,
                      child: _UploadStep(
                        label: switch (step) {
                          .upload => 'Upload',
                          .verification => 'Verification',
                          .converting => 'Converting',
                          .download => 'Download',
                        },
                        step: step,
                        currentStep: currentStep,
                        errorStep: errorStep,
                        isComplete: progress >= 1 && step == currentStep,
                        isStarted: progress > 0 && step == currentStep,
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Color _connectColor(int index) {
    if (errorStep != null && errorStep!.index == index + 1) return _kErrorColor;
    if (index < currentStep.index && errorStep == null) return _kSuccessColor;
    return Colors.grey[300]!;
  }
}

class _UploadLinear extends StatelessWidget {
  const _UploadLinear({
    required this.progress,
    required this.currentStep,
    this.errorStep,
    this.errorMessage,
  });

  final double progress;
  final ProcessStep currentStep;
  final ProcessStep? errorStep;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: .start,
      children: <Widget>[
        LinearProgressIndicator(
          value: progress,
          minHeight: 10,
          borderRadius: .circular(8),
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
            errorStep != null ? _kErrorColor : _kSuccessColor,
          ),
        ),
        if (errorStep != null || progress > 0)
          Center(
            child: Row(
              spacing: 8,
              mainAxisAlignment: .center,
              children: <Widget>[
                if (errorStep != null)
                  const Icon(
                    Icons.error_outline,
                    color: _kErrorColor,
                    size: 18,
                  ),
                Flexible(
                  child: Text(
                    errorStep != null
                        ? errorMessage ?? 'Error occurred'
                        : switch (currentStep) {
                            .upload => 'Uploading...',
                            .verification => 'Verification...',
                            .converting => 'Converting...',
                            .download => 'Downloading...',
                          },
                    textAlign: .center,
                    style: TextStyle(
                      color: errorStep != null
                          ? _kErrorColor
                          : Colors.grey[600],
                      fontWeight: errorStep != null ? .w600 : .w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _UploadStep extends StatelessWidget {
  const _UploadStep({
    required this.label,
    required this.step,
    required this.currentStep,
    this.errorStep,
    this.isComplete = false,
    this.isStarted = false,
  });

  final String label;
  final ProcessStep step;
  final ProcessStep currentStep;
  final ProcessStep? errorStep;
  final bool isComplete;
  final bool isStarted;

  @override
  Widget build(BuildContext context) {
    final hasErrorStep = errorStep == null;
    var status = ProcessStatus.none;

    if (errorStep == step) {
      status = .error;
    } else if (step.index < currentStep.index && hasErrorStep) {
      status = .success;
    } else if (step.index == currentStep.index && hasErrorStep && isStarted) {
      status = .loading;
    }

    final circleStatus = SizedBox.square(
      dimension: status == .none ? 10 : _kCircleSize,
      child: switch (status) {
        .success => DecoratedBox(
          decoration: BoxDecoration(
            shape: .circle,
            border: .all(color: _kSuccessColor, width: 2),
          ),
          child: const Icon(Icons.check, color: _kSuccessColor, size: 16),
        ),
        .error => DecoratedBox(
          decoration: BoxDecoration(
            shape: .circle,
            border: .all(color: _kErrorColor, width: 2),
          ),
          child: const Icon(Icons.close, color: _kErrorColor, size: 16),
        ),
        .loading => switch (isComplete) {
          true => DecoratedBox(
            decoration: BoxDecoration(
              shape: .circle,
              border: .all(color: _kSuccessColor, width: 2),
            ),
            child: const Icon(Icons.check, color: _kSuccessColor, size: 16),
          ),
          false => CircularProgressIndicator(
            strokeWidth: 2.5,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(_kSuccessColor),
          ),
        },
        .none => DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey[300], shape: .circle),
        ),
      },
    );

    return Column(
      spacing: 8,
      mainAxisSize: .min,
      children: <Widget>[
        SizedBox(
          height: _kCircleSize,
          child: Center(child: circleStatus),
        ),
        Text(
          label,
          softWrap: false,
          textAlign: .center,
          overflow: .visible,
          style: TextStyle(
            fontSize: 12,
            color: switch (status) {
              .success || .loading => Colors.grey[800]!,
              .error => _kErrorColor,
              .none => Colors.grey[400]!,
            },
            fontWeight: switch (status) {
              .success || .none => .normal,
              .error || .loading => .w600,
            },
          ),
        ),
      ],
    );
  }
}
