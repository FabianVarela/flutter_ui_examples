import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.iconData,
    required this.onPressed,
    super.key,
  });

  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 10,
        padding: const .all(10),
        minimumSize: const .square(50),
        shape: RoundedRectangleBorder(borderRadius: .circular(10)),
      ),
      child: Icon(iconData, size: 24),
    );
  }
}
