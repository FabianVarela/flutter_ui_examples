import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_beer/beer_model.dart';

class BeerBottleItem extends StatelessWidget {
  const BeerBottleItem({
    required this.beer,
    required this.controller,
    this.index = 0,
    super.key,
  });

  final BeerModel beer;
  final PageController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        var value = controller.position.haveDimensions
            ? (controller.page ?? 0) - index
            : index.toDouble();

        value = Curves.easeOut.transform(
          (1 - (value.abs() * .4)).clamp(0.0, 1.0),
        );

        return Center(
          child: SizedBox(
            height: value * Responsive().setHeight(400),
            width: value * Responsive().setWidth(250),
            child: child,
          ),
        );
      },
      child: Image.asset(beer.bottleLogo, fit: BoxFit.fitHeight),
    );
  }
}
