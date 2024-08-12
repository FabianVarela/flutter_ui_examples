part of '../beer_ui.dart';

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
        var value = 1.0;
        if (controller.position.haveDimensions) {
          value = (controller.page ?? 0) - index;
          value = Curves.easeOut.transform(
            (1 - (value.abs() * .5)).clamp(0.0, 1.0),
          );
        }

        return Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            // TODO(FV): Review logo animation
            Positioned(
              right: -30,
              child: Container(
                width: 40,
                height: 60,
                color: index.isOdd ? Colors.red : Colors.blue,
              ),
            ),
            Center(
              child: SizedBox.fromSize(
                size: Size(250, value * 350),
                child: child,
              ),
            ),
          ],
        );
      },
      child: Image.asset(beer.bottleImage, fit: BoxFit.fitHeight),
    );
  }
}
