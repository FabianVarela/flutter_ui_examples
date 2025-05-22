// This is a private part with default value.
// ignore_for_file: unused_element, unused_element_parameter

part of '../../sneaky_detail_ui.dart';

num _degToRad(num deg) => deg * (pi / 180.0);

num _radToDeg(num rad) => rad * (180.0 / pi);

class _Control360 extends StatefulWidget {
  const _Control360({
    required this.onChangeValue,
    this.size = 200,
    this.value = 0,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black87,
    this.onDisableScroll,
  });

  final ValueSetter<double> onChangeValue;
  final double size;
  final double value;
  final Color backgroundColor;
  final Color foregroundColor;
  final ValueSetter<bool>? onDisableScroll;

  @override
  _Control360State createState() => _Control360State();
}

class _Control360State extends State<_Control360> {
  final _circleKey = GlobalKey();

  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    final width = widget.size / 5;
    final circleSize = Size(widget.size * 0.8, widget.size * 0.8);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        RawGestureDetector(
          gestures: {
            _AllowMultipleGestures:
                GestureRecognizerFactoryWithHandlers<_AllowMultipleGestures>(
                  _AllowMultipleGestures.new,
                  (_AllowMultipleGestures instance) {
                    instance
                      ..onStart = (details) {
                        _onPanStart(details, widget.size, width);
                        widget.onDisableScroll?.call(true);
                      }
                      ..onUpdate = (details) {
                        _onPanUpdate(details, widget.size);
                      }
                      ..onEnd = (_) {
                        widget.onDisableScroll?.call(false);
                        if (!_isValid) return;
                      };
                  },
                ),
          },
          child: Container(
            alignment: FractionalOffset.center,
            child: CustomPaint(
              key: _circleKey,
              size: circleSize,
              painter: _CircularPainter(
                backgroundColor: widget.backgroundColor,
                foregroundColor: widget.foregroundColor,
                value: widget.value,
                width: width,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: widget.size * 0.6,
          height: widget.size * 0.6,
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          child: Text(
            '${widget.value.round()}º',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Offset _getLocalOffset(Offset offset) {
    final render = _circleKey.currentContext!.findRenderObject() as RenderBox?;
    return render!.globalToLocal(offset);
  }

  void _onPanStart(DragStartDetails details, double size, double width) {
    final offset = _getLocalOffset(details.globalPosition);
    _isValid = _checkValidTouch(offset, size, width);

    if (!_isValid) if (kDebugMode) print('Start: Is not valid');
  }

  void _onPanUpdate(DragUpdateDetails details, double size) {
    if (!_isValid) {
      if (kDebugMode) print('Update: Is not valid');
      return;
    }

    final offset = _getLocalOffset(details.globalPosition);
    final x = offset.dx;
    final y = offset.dy;
    final center = size / 2;

    var radians = atan((x - center) / (center - y));
    if (y > center) {
      radians += _degToRad(180);
    } else if (x < center) {
      radians += _degToRad(360);
    }

    final value = radians / _degToRad(360);
    _setValue(value * 360);
  }

  void _setValue(double value) {
    if (kDebugMode) print('Current º: ${value.toStringAsFixed(0)}');
    (value > 359) ? widget.onChangeValue(0) : widget.onChangeValue(value);
  }

  bool _checkValidTouch(Offset offset, double size, double width) {
    final halfSize = size / 2;

    final innerRadius = halfSize - (width / 2) * 3;
    final dx = offset.dx;
    final dy = offset.dy;
    final distance = sqrt(pow(dx - halfSize, 2) + pow(dy - halfSize, 2));

    if (distance < innerRadius || distance > halfSize) return false;
    return true;
  }
}

class _AllowMultipleGestures extends PanGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class _CircularPainter extends CustomPainter {
  _CircularPainter({
    required this.value,
    required this.width,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final double value;
  final double width;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    const measuringSize = 15;
    const shadowColor = Colors.black12;

    final center = size.width * 0.5;
    final offsetCenter = Offset(center, center);

    final radiusOffset = (width / 2) * 0.4;
    final outerRadius = center * 1.4 - radiusOffset;
    final innerRadius = center - (width / 2) * 1.5 + radiusOffset;

    final path = Path.combine(
      PathOperation.difference,
      Path()
        ..addOval(Rect.fromCircle(center: offsetCenter, radius: outerRadius)),
      Path()
        ..addOval(Rect.fromCircle(center: offsetCenter, radius: innerRadius)),
    );
    canvas.drawShadow(path, shadowColor, 4, true);

    final circlePaint = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    final offsetCircle = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(offsetCircle, radius, circlePaint);

    final linePaint = Paint()
      ..color = foregroundColor
      ..strokeWidth = 2;

    const division = 360 / measuringSize;
    for (var i = 0; i < measuringSize; i++) {
      final angle = division * i - (180 + value);
      final offsetInit = _angleToPoint(size.width / 2, angle);
      final offsetEnd = _angleToPoint((size.width / 2) + 5, angle);

      canvas
        ..save()
        ..translate(size.width / 2, size.height / 2);

      i == 0
          ? canvas.drawCircle(offsetInit, 3, linePaint)
          : canvas.drawLine(offsetInit, offsetEnd, linePaint);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;

  Offset _angleToPoint(double radius, double angle) {
    // cos, sin
    return Offset(
      radius * sin(pi * angle / 180),
      radius * cos(pi * angle / 180),
    );
  }
}
