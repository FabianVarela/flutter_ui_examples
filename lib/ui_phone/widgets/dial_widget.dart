part of '../phone_ui.dart';

const _kDigitAngleDeg = <int, double>{
  1: 78.0,
  2: 51.0,
  3: 24.0,
  4: 357.0,
  5: 330.0,
  6: 303.0,
  7: 276.0,
  8: 249.0,
  9: 222.0,
  0: 195.0,
};

const double _kPinDeg = 168;
const double _kWhiteArcStartDeg = 182; // 13° antes del 0 (195°)
const double _kWhiteArcSweepDeg = 270; // 9° más allá del 1 (78°)

double _deg2rad(double d) => d * math.pi / 180;

double _rad2deg(double r) => r * 180 / math.pi;

double _maxRotDeg(int digit) {
  return (_kPinDeg - _kDigitAngleDeg[digit]! + 350) % 360;
}

class RotaryPasscodeWidget extends StatefulWidget {
  const RotaryPasscodeWidget({
    required this.passcode,
    this.onSuccess,
    this.onFailure,
    this.passcodeLength,
    super.key,
  });

  final String passcode;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;
  final int? passcodeLength;

  int get effectiveLength => passcodeLength ?? passcode.length;

  @override
  State<RotaryPasscodeWidget> createState() => _RotaryPasscodeWidgetState();
}

class _RotaryPasscodeWidgetState extends State<RotaryPasscodeWidget>
    with TickerProviderStateMixin {
  late final AnimationController _springCtrl;
  late final Animation<double> _springAnim;
  late final AnimationController _shakeCtrl;
  late final Animation<double> _shakeAnim;

  double _rotation = 0;
  double _lastAngle = 0;
  double _maxRotRad = 0;
  double _springFrom = 0;

  int? _activeDigit;
  bool _dragging = false;

  final List<int> _entered = [];
  ValidationState _vState = .idle;

  @override
  void initState() {
    super.initState();

    _springCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );

    _springAnim = CurvedAnimation(
      parent: _springCtrl,
      curve: Curves.elasticOut,
    );

    _springCtrl
      ..addListener(() {
        setState(() => _rotation = _springFrom * (1.0 - _springAnim.value));
      })
      ..addStatusListener((s) {
        if (s == .completed) {
          _rotation = 0.0;
          _activeDigit = null;
        }
      });

    _shakeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 480),
    );

    _shakeAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -14), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -14, end: 14), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 14, end: -9), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -9, end: 9), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 9, end: 0), weight: 1),
    ]).animate(_shakeCtrl);
  }

  @override
  void dispose() {
    _springCtrl.dispose();
    _shakeCtrl.dispose();
    super.dispose();
  }

  double _touchAngleDeg(Offset center, Offset pos) {
    final dx = pos.dx - center.dx;
    final dy = pos.dy - center.dy;
    return (_rad2deg(math.atan2(dy, dx)) + 90 + 360) % 360;
  }

  int? _hitDigit(Offset center, Offset pos, double R) {
    final dialR = R * 0.982;
    final innerR = R * 0.52;

    final orbitR = (dialR + innerR) / 2;
    final holeR = R * 0.085;

    final dist = (pos - center).distance;
    if (dist < innerR || dist > dialR) return null;

    final angle = _touchAngleDeg(center, pos);

    int? best;
    double bestD = 20;

    for (final e in _kDigitAngleDeg.entries) {
      final diff = (angle - e.value).abs();
      final d = math.min(diff, 360.0 - diff);

      final rad = _deg2rad(e.value - 90);
      final hc = Offset(
        center.dx + orbitR * math.cos(rad),
        center.dy + orbitR * math.sin(rad),
      );

      if ((pos - hc).distance < holeR * 1.4 && d < bestD) {
        bestD = d;
        best = e.key;
      }
    }
    return best;
  }

  void _onPanStart(DragStartDetails det, Offset center, double R) {
    if (_vState != .idle) return;
    if (_springCtrl.isAnimating) {
      _springCtrl
        ..stop()
        ..reset();
    }

    final digit = _hitDigit(center, det.localPosition, R);
    if (digit == null) return;

    _activeDigit = digit;
    _maxRotRad = _deg2rad(_maxRotDeg(digit));
    _lastAngle = _deg2rad(_touchAngleDeg(center, det.localPosition));
    _dragging = true;

    unawaited(HapticFeedback.selectionClick());
  }

  void _onPanUpdate(DragUpdateDetails det, Offset center) {
    if (!_dragging || _activeDigit == null) return;

    final cur = _deg2rad(_touchAngleDeg(center, det.localPosition));
    var delta = cur - _lastAngle;

    if (delta > math.pi) delta -= 2 * math.pi;
    if (delta < -math.pi) delta += 2 * math.pi;

    _lastAngle = cur;
    setState(() => _rotation = (_rotation + delta).clamp(0.0, _maxRotRad));
  }

  void _onPanEnd(DragEndDetails _) {
    if (!_dragging || _activeDigit == null) return;
    _dragging = false;

    if (_rotation >= _maxRotRad * .92) {
      unawaited(HapticFeedback.mediumImpact());
      _registerDigit(_activeDigit!);
    }

    _springFrom = _rotation;
    _springCtrl.reset();

    unawaited(_springCtrl.forward());
  }

  void _registerDigit(int digit) {
    if (_entered.length >= widget.effectiveLength) return;

    setState(() => _entered.add(digit));
    debugPrint(
      '[RotaryDial] digit: $digit | entered: $_entered | '
      'remaining: ${widget.effectiveLength - _entered.length}',
    );

    if (_entered.length == widget.effectiveLength) {
      Future.delayed(
        const Duration(milliseconds: 350),
        () => _validate(_entered.join()),
      );
    }
  }

  void _validate(String entered) {
    final ok = entered == widget.passcode;
    debugPrint(
      '[RotaryDial] "$entered" vs "${widget.passcode}" → '
      '${ok ? "✅ SUCCESS" : "❌ FAILURE"}',
    );

    if (ok) {
      setState(() => _vState = .success);
      unawaited(HapticFeedback.heavyImpact());

      widget.onSuccess?.call();
      Future.delayed(const Duration(seconds: 2), _reset);
    } else {
      setState(() => _vState = .failure);
      unawaited(HapticFeedback.vibrate());

      _shakeCtrl.reset();
      unawaited(
        _shakeCtrl.forward().then((_) {
          widget.onFailure?.call();
          _reset();
        }),
      );
    }
  }

  void _reset() => setState(() {
    _entered.clear();
    _vState = .idle;
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      mainAxisAlignment: .center,
      children: <Widget>[
        const Padding(
          padding: .only(left: 32),
          child: Align(
            alignment: .centerLeft,
            child: Text(
              'ENTER YOUR PASSCODE',
              style: TextStyle(fontSize: 28, fontWeight: .w900),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _shakeAnim,
          builder: (_, _) => Transform.translate(
            offset: Offset(_shakeAnim.value, 0),
            child: _DotsIndicator(
              total: widget.effectiveLength,
              filled: _entered.length,
              state: _vState,
            ),
          ),
        ),
        Padding(
          padding: const .symmetric(horizontal: 20),
          child: AspectRatio(
            aspectRatio: 1,
            child: LayoutBuilder(
              builder: (_, constraint) {
                final sz = constraint.maxWidth;
                final center = Offset(sz / 2, sz / 2);

                return GestureDetector(
                  onPanStart: (d) => _onPanStart(d, center, sz / 2),
                  onPanUpdate: (d) => _onPanUpdate(d, center),
                  onPanEnd: _onPanEnd,
                  child: CustomPaint(
                    size: Size(sz, sz),
                    painter: _RotaryDialPainter(
                      rotationRad: _rotation,
                      vState: _vState,
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

class _DotsIndicator extends StatelessWidget {
  const _DotsIndicator({
    required this.total,
    required this.filled,
    required this.state,
  });

  final int total;
  final int filled;
  final ValidationState state;

  @override
  Widget build(BuildContext context) {
    final color = switch (state) {
      .idle => Colors.black,
      .success => Colors.green.shade700,
      .failure => Colors.red.shade600,
    };

    return Padding(
      padding: const .only(right: 32),
      child: Align(
        alignment: .centerRight,
        child: Row(
          spacing: 8,
          mainAxisSize: .min,
          children: List.generate(total, (i) {
            return SizedBox.square(
              dimension: 14,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  shape: .circle,
                  border: .all(color: color, width: 2),
                  color: i < filled ? color : Colors.transparent,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
