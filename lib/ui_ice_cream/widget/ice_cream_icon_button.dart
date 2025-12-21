import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class IceCreamIconButton extends StatelessWidget {
  const IceCreamIconButton({
    required this.path,
    this.size = const Size(40, 40),
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.padding = const EdgeInsets.all(8),
    this.onPress,
    super.key,
  });

  final String path;
  final Size size;
  final Color backgroundColor;
  final Color foregroundColor;
  final EdgeInsets padding;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      style: IconButton.styleFrom(
        elevation: 10,
        padding: padding,
        maximumSize: size,
        shadowColor: Colors.black26,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        disabledBackgroundColor: backgroundColor.withValues(alpha: .7),
        disabledForegroundColor: foregroundColor.withValues(alpha: .7),
        shape: RoundedRectangleBorder(borderRadius: .circular(12)),
      ),
      icon: VectorGraphic(
        loader: AssetBytesLoader(path),
        colorFilter: ColorFilter.mode(
          onPress == null
              ? foregroundColor.withValues(alpha: .5)
              : foregroundColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
