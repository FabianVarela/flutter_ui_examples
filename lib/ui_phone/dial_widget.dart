import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ─────────────────────────────────────────────
// ENTRY POINT – wrap RotaryPasscodeScreen in
// your app or replace with your own scaffold.
// ─────────────────────────────────────────────

class RotaryPasscodeScreen extends StatelessWidget {
  const RotaryPasscodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RotaryPasscodeWidget(
          passcode: '1234', // ← passcodeLength defaults to passcode.length (4)
          onSuccess: () {
            // Navigate or show success
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('✓ Access granted')),
            );
          },
          onFailure: () {
            // Called after wrong code animation
          },
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// PUBLIC WIDGET
// ─────────────────────────────────────────────

class RotaryPasscodeWidget extends StatefulWidget {
  /// The correct passcode string, e.g. '1024'
  final String passcode;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;

  /// How many digits the user must dial before validation triggers.
  /// Defaults to passcode.length if not provided.
  final int? passcodeLength;

  const RotaryPasscodeWidget({
    super.key,
    required this.passcode,
    this.onSuccess,
    this.onFailure,
    this.passcodeLength,
  });

  int get effectiveLength => passcodeLength ?? passcode.length;

  @override
  State<RotaryPasscodeWidget> createState() => _RotaryPasscodeWidgetState();
}

// ─────────────────────────────────────────────
// STATE
// ─────────────────────────────────────────────

class _RotaryPasscodeWidgetState extends State<RotaryPasscodeWidget>
    with TickerProviderStateMixin {
  // ── Dial geometry ──
  // Digit holes are placed at these angles (degrees from top, clockwise).
  // On a real rotary: 1 is closest to the stop (right side), 0 is furthest.
  // Layout as seen in the image (numbers around the top half mostly):
  //   0 → ~320°, 1 → ~345°, 2 → ~15°, 3 → ~45°, 4 → ~75°
  //   5 → ~105°, 6 → ~135°, 7 → ~165°, 8 → ~195°, 9 → ~230° (approx)
  // We store as radians measured from the 3-o'clock position (standard math angle).
  // Below we define angular positions using the same convention as CustomPainter
  // (0 = 3 o'clock, measured CCW for math, but Flutter canvas is CW).
  // To keep things clear: we work in "clock degrees" (0 = 12 o'clock, CW).

  // Angles in clock-degrees (0 = 12 o'clock, CW).
  // Stop at 3 o'clock (90°). Digits 1→0 spaced ~30° CCW from stop.
  // 1 is just CCW of stop, 0 is furthest away.
  static const Map<int, double> _digitAngleDeg = {
    1: 62.0, // ~2 o'clock
    2: 32.0,
    3: 2.0, // ~12 o'clock
    4: 332.0,
    5: 302.0, // ~10 o'clock
    6: 272.0, // ~9 o'clock
    7: 242.0,
    8: 212.0,
    9: 182.0, // ~6 o'clock
    0: 152.0, // ~5 o'clock
  };

  // Finger stop at 3 o'clock
  static const double _stopAngleDeg = 90.0;

  // How much the dial can rotate max (digit 0 at 316° needs ~(360-316+stopAngle) degrees to reach stop)
  // Actually: rotation = stopAngle - digitAngle (for CCW drag, i.e. dial turns CW)
  // Real phone: you pull CW until digit hits stop, then release → spring back CCW
  // Max rotation needed = stop - digit[0] = 356 - 316 = 40°? No...
  // The user rotates the DIAL CW. The digit hole travels CW to the stop.
  // Distance = (_stopAngleDeg - digitAngleDeg + 360) % 360
  // For digit 0: (356 - 316 + 360) % 360 = 40°
  // For digit 9: (356 - 232 + 360) % 360 = 124°
  // For digit 1: (356 - 350 + 360) % 360 = 6°

  // ── State ──
  double _currentRotation = 0.0; // radians, positive = CW
  // Incremental tracking: store PREVIOUS frame angle to avoid >180° wrap bug
  double _lastDragAngle = 0.0;
  int? _activeDigit;
  double _maxRotationForActiveDigit = 0.0;
  bool _dragging = false;

  final List<int> _entered = [];
  ValidationState _validationState = ValidationState.idle;

  // ── Animations ──
  late AnimationController _springController;
  late Animation<double> _springAnimation;
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;
  late AnimationController _successController;

  double _springFrom = 0.0;

  @override
  void initState() {
    super.initState();

    _springController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _springAnimation = CurvedAnimation(
      parent: _springController,
      curve: Curves.elasticOut,
    );
    _springController.addListener(() {
      setState(() {
        _currentRotation = _springFrom * (1.0 - _springAnimation.value);
      });
    });
    _springController.addStatusListener((s) {
      if (s == AnimationStatus.completed) {
        _currentRotation = 0.0;
        _activeDigit = null;
      }
    });

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _shakeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -12.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -12.0, end: 12.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 12.0, end: -8.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -8.0, end: 8.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 8.0, end: 0.0), weight: 1),
    ]).animate(_shakeController);

    _successController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _springController.dispose();
    _shakeController.dispose();
    _successController.dispose();
    super.dispose();
  }

  // ── Geometry helpers ──

  /// Returns the angle in "clock degrees" of a touch point relative to center.
  double _touchAngleDeg(Offset center, Offset touch) {
    final dx = touch.dx - center.dx;
    final dy = touch.dy - center.dy;
    // atan2 gives angle from +x axis, CCW. Convert to clock degrees (0=top, CW).
    final rad = math.atan2(dy, dx);
    return (degrees(rad) + 90 + 360) % 360;
  }

  /// Max CW rotation (degrees) to bring [digit] to the stop.
  double _maxRotationDeg(int digit) {
    final digitAngle = _digitAngleDeg[digit]!;
    return (_stopAngleDeg - digitAngle + 360) % 360;
  }

  /// Given a touch point and the dial center+radius, which digit hole is hit?
  int? _hitDigit(Offset center, Offset touch, double outerRadius) {
    final dist = (touch - center).distance;
    // Digit holes live roughly between 62%–88% of outer radius
    final inner = outerRadius * 0.62;
    final outer = outerRadius * 0.88;
    if (dist < inner || dist > outer) return null;

    final angle = _touchAngleDeg(center, touch);
    // Adjust for current rotation
    final adjustedAngle = (angle - degrees(_currentRotation) + 360) % 360;

    int? closest;
    double minDist = 18.0; // degrees tolerance
    for (final entry in _digitAngleDeg.entries) {
      final diff = ((adjustedAngle - entry.value).abs());
      final d = math.min(diff, 360 - diff);
      if (d < minDist) {
        minDist = d;
        closest = entry.key;
      }
    }
    return closest;
  }

  // ── Gesture handlers ──

  void _onPanStart(DragStartDetails details, Offset center, double radius) {
    if (_validationState != ValidationState.idle) return;
    if (_springController.isAnimating) {
      _springController.stop();
      _springController.reset();
    }

    final digit = _hitDigit(center, details.localPosition, radius);
    if (digit == null) return;

    _activeDigit = digit;
    _maxRotationForActiveDigit = _maxRotationDeg(digit) * math.pi / 180;
    // Store initial angle for incremental delta tracking
    _lastDragAngle =
        _touchAngleDeg(center, details.localPosition) * math.pi / 180;
    _dragging = true;
    HapticFeedback.selectionClick();
  }

  void _onPanUpdate(DragUpdateDetails details, Offset center) {
    if (!_dragging || _activeDigit == null) return;

    final currentAngle =
        _touchAngleDeg(center, details.localPosition) * math.pi / 180;

    // Incremental delta between this frame and the last.
    // Normalise to (-π, π] to handle the 0/2π boundary correctly,
    // even for rotations that exceed 180° (digits 7, 8, 9, 0).
    var delta = currentAngle - _lastDragAngle;
    if (delta > math.pi) delta -= 2 * math.pi;
    if (delta < -math.pi) delta += 2 * math.pi;

    _lastDragAngle = currentAngle;

    final newRotation = (_currentRotation + delta).clamp(
      0.0,
      _maxRotationForActiveDigit,
    );

    setState(() => _currentRotation = newRotation);
  }

  void _onPanEnd(DragEndDetails details) {
    if (!_dragging || _activeDigit == null) return;
    _dragging = false;

    final reachedStop =
        _currentRotation >=
        _maxRotationForActiveDigit * 0.92; // 92% counts as "dialled"

    if (reachedStop) {
      HapticFeedback.mediumImpact();
      _registerDigit(_activeDigit!);
    }

    // Spring back
    _springFrom = _currentRotation;
    _springController.reset();
    _springController.forward();
  }

  void _registerDigit(int digit) {
    if (_entered.length >= widget.effectiveLength) return;
    setState(() => _entered.add(digit));

    // 🐛 DEBUG
    debugPrint(
      '[RotaryDial] digit dialled: $digit | '
      'entered so far: $_entered | '
      'remaining: ${widget.effectiveLength - _entered.length}',
    );

    if (_entered.length == widget.effectiveLength) {
      final entered = _entered.join();
      Future.delayed(
        const Duration(milliseconds: 400),
        () => _validate(entered),
      );
    }
  }

  void _validate(String entered) {
    final isCorrect = entered == widget.passcode;
    debugPrint(
      '[RotaryDial] validate → entered: "$entered" | '
      'expected: "${widget.passcode}" | '
      'result: ${isCorrect ? "✅ SUCCESS" : "❌ FAILURE"}',
    );
    if (isCorrect) {
      setState(() => _validationState = ValidationState.success);
      HapticFeedback.heavyImpact();
      widget.onSuccess?.call();
      Future.delayed(const Duration(seconds: 2), _reset);
    } else {
      setState(() => _validationState = ValidationState.failure);
      HapticFeedback.vibrate();
      _shakeController.reset();
      _shakeController.forward().then((_) {
        widget.onFailure?.call();
        _reset();
      });
    }
  }

  void _reset() {
    setState(() {
      _entered.clear();
      _validationState = ValidationState.idle;
    });
  }

  // ── Build ──

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Title
        const Padding(
          padding: EdgeInsets.only(left: 32.0, bottom: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'ENTER\nPASSCODE',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                height: 1.1,
                letterSpacing: 1,
              ),
            ),
          ),
        ),

        // Dot indicators
        AnimatedBuilder(
          animation: _shakeAnimation,
          builder: (_, __) {
            return Transform.translate(
              offset: Offset(_shakeAnimation.value, 0),
              child: _DotsIndicator(
                total: widget.effectiveLength,
                filled: _entered.length,
                state: _validationState,
              ),
            );
          },
        ),

        const SizedBox(height: 40),

        // Dial
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AspectRatio(
            aspectRatio: 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final size = constraints.maxWidth;
                final center = Offset(size / 2, size / 2);
                final radius = size / 2;

                return GestureDetector(
                  onPanStart: (d) => _onPanStart(d, center, radius),
                  onPanUpdate: (d) => _onPanUpdate(d, center),
                  onPanEnd: _onPanEnd,
                  child: CustomPaint(
                    size: Size(size, size),
                    painter: _RotaryDialPainter(
                      rotationRad: _currentRotation,
                      activeDigit: _activeDigit,
                      validationState: _validationState,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// DOTS INDICATOR
// ─────────────────────────────────────────────

class _DotsIndicator extends StatelessWidget {
  final int total;
  final int filled;
  final ValidationState state;

  const _DotsIndicator({
    required this.total,
    required this.filled,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    Color dotColor = Colors.black;
    if (state == ValidationState.success) dotColor = Colors.green.shade700;
    if (state == ValidationState.failure) dotColor = Colors.red.shade700;

    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(total, (i) {
            final isFilled = i < filled;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 14,
              height: 14,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isFilled ? dotColor : Colors.transparent,
                border: Border.all(color: dotColor, width: 2),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// CUSTOM PAINTER
// ─────────────────────────────────────────────

class _RotaryDialPainter extends CustomPainter {
  final double rotationRad;
  final int? activeDigit;
  final ValidationState validationState;

  const _RotaryDialPainter({
    required this.rotationRad,
    required this.activeDigit,
    required this.validationState,
  });

  // Mirror of State's map — painter can't access State directly
  static const Map<int, double> _digitAngleDegStatic = {
    1: 62.0,
    2: 32.0,
    3: 2.0,
    4: 332.0,
    5: 302.0,
    6: 272.0,
    7: 242.0,
    8: 212.0,
    9: 182.0,
    0: 152.0,
  };

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final R = size.width / 2;
    final dialR = R * 0.88;
    final innerR = R * 0.385;
    final holeR = R * 0.112;
    final orbitR = R * 0.690;

    // 1. Outer black disc
    canvas.drawCircle(center, R, Paint()..color = Colors.black);

    // 2. White dial area (static base)
    canvas.drawCircle(center, dialR, Paint()..color = Colors.white);

    // 3. Stop arc — static black wedge at 3 o'clock (right side)
    _drawStopArc(canvas, center, R, dialR);

    // 4. Rotating group
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationRad);
    canvas.translate(-center.dx, -center.dy);

    // White donut (covers center hole area during rotation)
    final donut = Path()
      ..addOval(Rect.fromCircle(center: center, radius: dialR))
      ..addOval(Rect.fromCircle(center: center, radius: innerR));
    donut.fillType = PathFillType.evenOdd;
    canvas.drawPath(donut, Paint()..color = Colors.white);

    // Digit holes
    for (final e in _digitAngleDegStatic.entries) {
      _drawDigitHole(
        canvas,
        center,
        orbitR,
        holeR,
        e.key,
        e.value,
        activeDigit == e.key,
      );
    }

    canvas.restore();

    // 5. Inner ring border (static, drawn on top so it doesn't rotate)
    canvas.drawCircle(
      center,
      innerR,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = R * 0.020,
    );

    // 6. Outer border
    canvas.drawCircle(
      center,
      R,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = R * 0.018,
    );

    // 7. Dial border ring
    canvas.drawCircle(
      center,
      dialR,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = R * 0.018,
    );
  }

  void _drawStopArc(Canvas canvas, Offset center, double R, double dialR) {
    // Solid black filled wedge between dialR and R, centred at 3 o'clock.
    // In clock-degrees: 3 o'clock = 90°. Arc spans ~55°.
    const centreClock = 90.0;
    const spanDeg = 55.0;
    final startClock = centreClock - spanDeg / 2; // 62.5°
    final startRad = (startClock - 90) * math.pi / 180;
    final sweepRad = spanDeg * math.pi / 180;

    final outerRect = Rect.fromCircle(center: center, radius: R * 0.995);
    final innerRect = Rect.fromCircle(center: center, radius: dialR * 1.002);

    final path = Path();
    path.arcTo(outerRect, startRad, sweepRad, false);
    // walk back along inner arc
    path.arcTo(innerRect, startRad + sweepRad, -sweepRad, false);
    path.close();
    canvas.drawPath(path, Paint()..color = Colors.black);

    // White pin dot — slightly below centre of arc
    const pinClock = centreClock + 16.0;
    final pinRad = (pinClock - 90) * math.pi / 180;
    final pinPos = Offset(
      center.dx + R * 0.930 * math.cos(pinRad),
      center.dy + R * 0.930 * math.sin(pinRad),
    );
    canvas.drawCircle(pinPos, R * 0.033, Paint()..color = Colors.white);
  }

  void _drawDigitHole(
    Canvas canvas,
    Offset center,
    double orbitR,
    double holeR,
    int digit,
    double angleDeg,
    bool isActive,
  ) {
    final rad = (angleDeg - 90) * math.pi / 180;
    final holeCenter = Offset(
      center.dx + orbitR * math.cos(rad),
      center.dy + orbitR * math.sin(rad),
    );

    canvas.drawCircle(
      holeCenter,
      holeR,
      Paint()..color = isActive ? const Color(0xFF2A2A2A) : Colors.black,
    );

    final tp = TextPainter(
      text: TextSpan(
        text: digit.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: holeR * 1.25,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, holeCenter - Offset(tp.width / 2, tp.height / 2));
  }

  @override
  bool shouldRepaint(_RotaryDialPainter old) =>
      old.rotationRad != rotationRad ||
      old.activeDigit != activeDigit ||
      old.validationState != validationState;
}

// ─────────────────────────────────────────────
// HELPERS
// ─────────────────────────────────────────────

enum ValidationState { idle, success, failure }

double degrees(num radians) => radians * 180 / math.pi;
