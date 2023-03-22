import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class _HookTweenAnimation extends Hook<Tween<double>> {
  const _HookTweenAnimation(this.animationController, this.begin, this.end);

  final AnimationController animationController;
  final double? begin;
  final double? end;

  @override
  _HookTweenAnimationState createState() => _HookTweenAnimationState();
}

class _HookTweenAnimationState
    extends HookState<Tween<double>, _HookTweenAnimation> {
  late Tween<double> _tweenAnimation;

  @override
  void initHook() {
    super.initHook();

    hook.animationController.addListener(() => setState(() {}));
    _tweenAnimation = Tween<double>(begin: hook.begin, end: hook.end);
  }

  @override
  Tween<double> build(BuildContext context) => _tweenAnimation;
}

Tween<double> useTweenAnimation(
  AnimationController controller, {
  double? begin,
  double? end,
}) {
  return use(_HookTweenAnimation(controller, begin, end));
}
