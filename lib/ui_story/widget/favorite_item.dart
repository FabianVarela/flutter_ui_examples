import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({required this.image, super.key});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Responsive().setWidth(18),
        right: Responsive().setWidth(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          image,
          width: Responsive().setWidth(296),
          height: Responsive().setHeight(222),
        ),
      ),
    );
  }
}
