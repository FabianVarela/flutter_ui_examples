import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/ui_music/radial/custom_gesture_detector_radial.dart';

class CustomRadialSeek extends StatefulWidget {
  CustomRadialSeek({
    this.padding = EdgeInsets.zero,
    this.width = 1,
    this.color = Colors.white,
    this.seekWidth = 2,
    this.seekColor = Colors.grey,
    this.seekPercent = 0,
    this.progressWidth = 2,
    this.progressColor = Colors.black,
    this.progress = 0,
    this.thumb,
    this.thumbPercent = 0,
    this.centerContent,
    this.onDragStart,
    this.onDragUpdate,
    this.onDragEnd,
  });

  final EdgeInsets padding;
  final double width;
  final Color color;
  final double seekWidth;
  final Color seekColor;
  final double seekPercent;
  final double progressWidth;
  final Color progressColor;
  final double progress;
  final Widget thumb;
  final double thumbPercent;
  final Widget centerContent;
  final Function(double) onDragStart;
  final Function(double) onDragUpdate;
  final Function(double) onDragEnd;

  @override
  _CustomRadialSeekState createState() => _CustomRadialSeekState();
}

class _CustomRadialSeekState extends State<CustomRadialSeek> {
  double _thumbPercent = 0;

  Coordinates _startCoordinates;
  double _currentPercent;

  @override
  void initState() {
    super.initState();
    _thumbPercent = widget.thumbPercent;
  }

  @override
  void didUpdateWidget(CustomRadialSeek oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_startCoordinates == null) {
      _thumbPercent = widget.thumbPercent;
    }
  }

  @override
  Widget build(BuildContext context) {
    double thumbPosition = widget.thumbPercent;
    if (_currentPercent != null) {
      thumbPosition = _currentPercent;
    }

    return CustomGestureDetectorRadial(
      onRadialDragStart: _onDragStart,
      onRadialDragUpdate: _onDragUpdate,
      onRadialDragEnd: _onDragEnd,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: _RadialProgress(
              padding: widget.padding,
              color: widget.color,
              width: widget.width,
              seekColor: widget.seekColor,
              seekWidth: widget.seekWidth,
              seekPercent: widget.seekPercent,
              progressColor: widget.progressColor,
              progressWidth: widget.progressWidth,
              progressPercent: widget.progress,
              thumb: widget.thumb,
              thumbPosition: thumbPosition,
              centerContent: widget.centerContent,
            ),
          ),
        ),
      ),
    );
  }

  void _onDragStart(Coordinates coordinates) {
    _startCoordinates = coordinates;
    if (widget.onDragStart != null) {
      widget.onDragStart(_thumbPercent);
    }
  }

  void _onDragUpdate(Coordinates coordinates) {
    final double angle = coordinates.angle - _startCoordinates.angle;
    final double percent = angle / (2 * pi);

    _currentPercent = (_thumbPercent + percent) % 1.0;

    if (widget.onDragUpdate != null) {
      widget.onDragUpdate(_thumbPercent);
    }
  }

  void _onDragEnd() {
    if (widget.onDragEnd != null) {
      widget.onDragEnd(_currentPercent);
    }

    _thumbPercent = _currentPercent;
    _startCoordinates = null;
    _currentPercent = null;
  }
}

class CircleThumb extends StatelessWidget {
  CircleThumb({this.color, this.diameter});

  final Color color;
  final double diameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

/// Radial Progress Widget

class _RadialProgress extends StatefulWidget {
  _RadialProgress({
    this.padding = EdgeInsets.zero,
    this.width = 3,
    this.color = Colors.grey,
    this.seekWidth = 5,
    this.seekColor = Colors.white,
    this.seekPercent = 0,
    this.progressWidth = 5,
    this.progressColor = Colors.black,
    this.progressPercent = 0,
    this.thumb,
    this.thumbPosition = 0,
    this.centerContent,
  });

  final EdgeInsets padding;
  final double width;
  final Color color;
  final double seekWidth;
  final Color seekColor;
  final double seekPercent;
  final double progressWidth;
  final Color progressColor;
  final double progressPercent;
  final Widget thumb;
  final double thumbPosition;
  final Widget centerContent;

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<_RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: widget.padding,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              CustomPaint(
                foregroundPainter: _RadialSeekPainter(
                  width: widget.width,
                  color: widget.color,
                  seekWidth: widget.seekWidth,
                  seekColor: widget.seekColor,
                  seekPercent: widget.seekPercent,
                  progressWidth: widget.progressWidth,
                  progressColor: widget.progressColor,
                  progressPercent: widget.progressPercent,
                ),
                child: ClipOval(
                  clipper: _RadialSeekClipper(),
                  child: widget.centerContent,
                ),
              ),
              LayoutBuilder(
                builder: (_, BoxConstraints constraints) {
                  final double width = constraints.maxWidth;
                  final double height = constraints.maxHeight;

                  final double radius = min(width, height) / 2;
                  final double thumbAngle =
                      2 * pi * widget.thumbPosition - (pi / 2);

                  final Offset relativeCenter = Offset(
                      cos(thumbAngle) * radius, sin(thumbAngle) * radius);
                  final Offset thumbAbsoluteCenter =
                      Offset(width / 2, height / 2) + relativeCenter;

                  return Transform(
                    transform: Matrix4.translationValues(
                      thumbAbsoluteCenter.dx,
                      thumbAbsoluteCenter.dy,
                      0,
                    ),
                    child: FractionalTranslation(
                      translation: Offset(-.5, -.5),
                      child: Center(child: widget.thumb ?? SizedBox()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Private class to render custom radial seek

class _RadialSeekPainter extends CustomPainter {
  _RadialSeekPainter({
    @required this.width,
    @required Color color,
    @required this.seekWidth,
    @required Color seekColor,
    @required this.seekPercent,
    @required this.progressWidth,
    @required Color progressColor,
    @required this.progressPercent,
  })  : radialPaint = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = width,
        seekPaint = Paint()
          ..color = seekColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = seekWidth
          ..strokeCap = StrokeCap.round,
        progressPaint = Paint()
          ..color = progressColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = progressWidth
          ..strokeCap = StrokeCap.round;

  final double width;
  final Paint radialPaint;
  final double seekWidth;
  final Paint seekPaint;
  final double seekPercent;
  final double progressWidth;
  final Paint progressPaint;
  final double progressPercent;

  @override
  void paint(Canvas canvas, Size size) {
    final Size finalSize = size;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(finalSize.width, finalSize.height) / 2;

    if (width > 0) {
      canvas.drawCircle(center, radius, radialPaint);
    }

    if (seekWidth > 0) {
      final double angle =
          2 * pi * (seekPercent >= 0 ? seekPercent : seekPercent + 1);

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
          angle, false, seekPaint);
    }

    if (progressWidth > 0) {
      final double angle = 2 *
          pi *
          (progressPercent >= 0 ? progressPercent : progressPercent + 1);

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
          angle, false, progressPaint);
    }
  }

  @override
  bool shouldRepaint(_RadialSeekPainter old) =>
      width != old.width ||
      radialPaint.color != old.radialPaint.color ||
      seekWidth != old.seekWidth ||
      seekPaint.color != old.seekPaint.color ||
      seekPercent != old.seekPercent ||
      progressWidth != old.progressWidth ||
      progressPaint.color != old.progressPaint.color ||
      progressPercent != old.progressPercent;
}

class _RadialSeekClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2,
      );

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
