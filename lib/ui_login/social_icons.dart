import 'package:flutter/material.dart';

class SocialIcons extends StatelessWidget {
  SocialIcons({
    required this.colors,
    required this.iconData,
    required this.onPressed,
  });

  final List<Color> colors;
  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colors,
            tileMode: TileMode.clamp,
          ),
        ),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}
