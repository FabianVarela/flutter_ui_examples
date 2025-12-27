part of '../switch_ui.dart';

class SwitchAnimation extends StatefulWidget {
  const SwitchAnimation({
    this.initialValue = false,
    this.size = 150,
    this.onText = 'ON',
    this.offText = 'OFF',
    super.key,
  }) : assert(size >= 80 && size <= 200, 'Size must be between 80 and 200');

  final bool initialValue;
  final double size;
  final String onText;
  final String offText;

  @override
  State<SwitchAnimation> createState() => _SwitchAnimationState();
}

class _SwitchAnimationState extends State<SwitchAnimation>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 600);

  late bool _isSwitched = widget.initialValue;

  late final double _size = widget.size;
  late final double _heightSize = widget.size / 2;
  late final double _heightPadding = 6;
  late final double _innerHeight = _heightSize - (_heightPadding * 2);

  late AnimationController _animationController;

  late Animation<double> _trapezeAnimation;
  late Animation<double> _pseudoLinearAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: _duration)
      ..addListener(_rebuild)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _isSwitched = !_isSwitched;
          _animationController.reset();
        }
      });

    _trapezeAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(begin: 0, end: 1).chain(
            CurveTween(curve: Curves.linear),
          ),
          weight: 1,
        ),
        TweenSequenceItem(tween: ConstantTween(1), weight: 2),
        TweenSequenceItem(
          tween: Tween<double>(begin: 1, end: 0).chain(
            CurveTween(curve: Curves.linear),
          ),
          weight: 1,
        ),
      ],
    ).animate(_animationController);

    _pseudoLinearAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: ConstantTween(0), weight: 1),
        TweenSequenceItem(
          tween: Tween<double>(begin: 0, end: 1).chain(
            CurveTween(curve: Curves.linear),
          ),
          weight: 2,
        ),
        TweenSequenceItem(tween: ConstantTween(1), weight: 1),
      ],
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController
      ..removeListener(_rebuild)
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = _isSwitched
        ? _pseudoLinearAnimation.value
        : 1 - _pseudoLinearAnimation.value;

    final color = Color.lerp(Colors.green, Colors.grey, value);
    final alignment = Alignment.lerp(.centerRight, .centerLeft, value)!;

    final opacityValue = _trapezeAnimation.value.floorToDouble();

    final opacity = lerpDouble(0, 1, opacityValue)!;
    final width = lerpDouble(_innerHeight, _size, _trapezeAnimation.value);

    return GestureDetector(
      onTap: _animationController.status != .completed
          ? _animationController.forward
          : null,
      child: SizedBox.fromSize(
        size: Size(_size, _heightSize),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: .circular(_heightSize / 2),
          ),
          child: Padding(
            padding: .all(_heightPadding),
            child: Stack(
              alignment: alignment,
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size(width ?? 0, _heightSize),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: .circular(_heightSize / 2),
                    ),
                  ),
                ),
                Center(
                  child: Opacity(
                    opacity: opacity,
                    child: Text(
                      _isSwitched ? widget.offText : widget.onText,
                      style: TextStyle(
                        fontWeight: .bold,
                        fontSize: _size / 6,
                        color: _isSwitched ? Colors.grey : Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _rebuild() => setState(() {});
}
