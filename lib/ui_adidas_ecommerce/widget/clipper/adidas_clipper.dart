part of '../../adidas_ui.dart';

class AdidasClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.2, size.height)
      ..lineTo(size.width, size.height * 0.2)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
