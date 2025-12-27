part of '../switch_ui.dart';

class SwitchCircularAnimation extends StatefulWidget {
  const SwitchCircularAnimation({
    this.size = 150,
    this.initialValue = false,
    super.key,
  }) : assert(size >= 80 && size <= 200, 'Size must be between 80 and 200');

  final double size;
  final bool initialValue;

  @override
  State<SwitchCircularAnimation> createState() =>
      _SwitchCircularAnimationState();
}

class _SwitchCircularAnimationState extends State<SwitchCircularAnimation>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 2000);

  late AnimationController _animationController;
  late Animation<double> _trapezeAnimation;
  late Animation<double> _pseudoLinearAnimation;

  late bool _isSwitched = widget.initialValue;

  late final double _size = widget.size;
  late final double _heightSize = widget.size / 2;

  double get _heightPadding => (widget.size * 0.075).clamp(0, 15);

  double get _innerHeight => _heightSize - (_heightPadding * 2);

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
    super.dispose();

    _animationController
      ..removeListener(_rebuild)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = _isSwitched
        ? _pseudoLinearAnimation.value
        : 1 - _pseudoLinearAnimation.value;

    final alignment = Alignment.lerp(.centerRight, .centerLeft, value)!;
    final padding = EdgeInsets.lerp(
      .all(_heightPadding),
      .zero,
      _trapezeAnimation.value,
    );

    final outerWidth = lerpDouble(_size, _size / 2, _trapezeAnimation.value);
    final square = lerpDouble(_innerHeight, _size / 2, _trapezeAnimation.value);

    final color = Color.lerp(Colors.green, Colors.blueAccent, value)!;

    return GestureDetector(
      onTap: _animationController.status != .completed
          ? _animationController.forward
          : null,
      child: SizedBox.fromSize(
        size: Size(outerWidth ?? 0, _heightSize),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: .circular(_heightSize / 2),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: color,
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: padding ?? .zero,
            child: Stack(
              alignment: alignment,
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size(square ?? 0, square ?? 0),
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: .all(.circular(200)),
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
