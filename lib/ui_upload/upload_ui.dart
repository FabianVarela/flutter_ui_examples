import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/ui_upload/widget/upload_progress.dart';

class UploadUI extends StatefulWidget {
  const UploadUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  State<UploadUI> createState() => _UploadUIState();
}

class _UploadUIState extends State<UploadUI> {
  double _progress = 0;
  String? _errorMessage;

  bool _isProcessing = false;
  bool _simulateError = false;

  ProgressStyle _selectedStyle = .stepper;

  ProcessStep _currentStep = .upload;
  ProcessStep? _errorStep;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Upload Animation'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: widget.onPressedMenu,
        ),
      ),
      body: SingleChildScrollView(
        padding: const .all(24),
        child: Column(
          spacing: 24,
          mainAxisAlignment: .center,
          children: <Widget>[
            Row(
              spacing: 12,
              children: <Widget>[
                for (final item in ProgressStyle.values)
                  Expanded(
                    child: InkWell(
                      onTap: _isProcessing
                          ? null
                          : () => setState(() => _selectedStyle = item),
                      borderRadius: .circular(8),
                      child: Container(
                        padding: const .symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _selectedStyle == item
                              ? const Color(0xFF4CAF50)
                              : Colors.grey[200],
                          borderRadius: .circular(8),
                        ),
                        child: Row(
                          spacing: 8,
                          mainAxisAlignment: .center,
                          children: <Widget>[
                            Icon(
                              switch (item) {
                                .stepper => Icons.timeline,
                                .bar => Icons.linear_scale,
                              },
                              color: _selectedStyle == item
                                  ? Colors.white
                                  : Colors.grey[600],
                              size: 20,
                            ),
                            Text(
                              switch (item) {
                                .stepper => 'Stepper (A)',
                                .bar => 'Bar (B)',
                              },
                              style: TextStyle(
                                color: _selectedStyle == item
                                    ? Colors.white
                                    : Colors.grey[800],
                                fontWeight: _selectedStyle == item
                                    ? .w600
                                    : .normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            UploadProgressWidget(
              progress: _progress,
              currentStep: _currentStep,
              style: _selectedStyle,
              errorStep: _errorStep,
              errorMessage: _errorMessage,
            ),
            Row(
              spacing: 12,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isProcessing ? null : _startUpload,
                    icon: const Icon(Icons.cloud_upload),
                    label: const Text('Start Upload'),
                    style: ElevatedButton.styleFrom(
                      padding: const .symmetric(vertical: 16),
                      backgroundColor: const Color(0xFF4CAF50),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _isProcessing ? null : _resetProgress,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    padding: const .symmetric(vertical: 16, horizontal: 24),
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(borderRadius: .circular(12)),
                    elevation: 0,
                  ),
                ),
              ],
            ),
            Card(
              elevation: 0,
              color: Colors.orange[50],
              shape: RoundedRectangleBorder(
                borderRadius: .circular(12),
                side: BorderSide(color: Colors.orange[200]!),
              ),
              child: CheckboxListTile(
                title: const Text(
                  'Simulate random errors',
                  style: TextStyle(fontWeight: .w500),
                ),
                subtitle: const Text(
                  'Enable to test error handling (30% probability)',
                  style: TextStyle(fontSize: 12),
                ),
                value: _simulateError,
                activeColor: Colors.orange[700],
                onChanged: _isProcessing
                    ? null
                    : (val) => setState(() => _simulateError = val ?? false),
                controlAffinity: .leading,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _startUpload() async {
    setState(() {
      _progress = 0.0;
      _currentStep = .upload;
      _isProcessing = true;
      _errorStep = null;
      _errorMessage = null;
    });

    var success = await _simulateProgress((start: 0, end: .25), .upload);
    if (!success) return;

    setState(() => _currentStep = .verification);
    success = await _simulateProgress((start: .25, end: .50), .verification);
    if (!success) return;

    setState(() => _currentStep = .converting);
    success = await _simulateProgress((start: .50, end: .85), .converting);
    if (!success) return;

    setState(() => _currentStep = .download);
    success = await _simulateProgress((start: .85, end: 1), .download);
    if (!success) return;

    setState(() => _isProcessing = false);
  }

  Future<bool> _simulateProgress(
    ({double start, double end}) args,
    ProcessStep step,
  ) async {
    const steps = 50;
    final increment = (args.end - args.start) / steps;

    for (var i = 0; i <= steps; i++) {
      if (!_isProcessing) return false;

      if (_simulateError && i > steps * 0.6) {
        final random = DateTime.now().millisecondsSinceEpoch % 100;
        if (random < 30) {
          setState(() {
            _errorStep = step;
            _errorMessage = switch (step) {
              .upload => 'Failed to upload file. Network error.',
              .verification => 'File verification failed. Invalid format.',
              .converting => 'Conversion process failed. Unsupported codec.',
              .download => 'Download failed. Connection timeout.',
            };
            _isProcessing = false;
          });
          return false;
        }
      }

      await Future<void>.delayed(const Duration(milliseconds: 40));
      if (mounted) setState(() => _progress = args.start + (increment * i));
    }
    return true;
  }

  void _resetProgress() {
    setState(() {
      _progress = 0.0;
      _currentStep = .upload;
      _isProcessing = false;
      _errorStep = null;
      _errorMessage = null;
    });
  }
}
