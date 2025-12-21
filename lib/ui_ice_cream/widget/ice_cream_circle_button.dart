import 'package:flutter/material.dart';

class IceCreamCircleButton extends StatelessWidget {
  const IceCreamCircleButton({
    required this.child,
    this.color = Colors.transparent,
    this.onPressed,
    super.key,
  });

  final Widget child;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox.square(
        dimension: 28,
        child: DecoratedBox(
          decoration: BoxDecoration(color: color, shape: .circle),
          child: Align(child: child),
        ),
      ),
    );
  }
}
