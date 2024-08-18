import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
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
    return InkWell(
      onTap: onPress,
      child: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-1, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: SvgPicture.asset(
          path,
          colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
