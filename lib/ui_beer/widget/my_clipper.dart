import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final totalSize = size.height;
    final path = Path()..lineTo(0, totalSize - 100);

    final point = Offset(20, totalSize);
    final endPoint = Offset(size.width / 2, totalSize);

    return path
      ..quadraticBezierTo(point.dx, point.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, totalSize)
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
