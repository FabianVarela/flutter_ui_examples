part of '../beer_ui.dart';

class BeerBottleItem extends StatelessWidget {
  const BeerBottleItem({
    required this.beer,
    required this.pageController,
    this.index = 0,
    super.key,
  });

  final BeerModel beer;
  final PageController pageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          top: 10,
          right: -30,
          child: AnimatedBuilder(
            animation: pageController,
            builder: (_, __) {
              var delta = 1.0;
              if (pageController.position.haveDimensions) {
                final resultPage = (pageController.page ?? 0) - index;
                delta = 1 - resultPage.abs().clamp(0.0, 1.0);
              }

              return Opacity(
                opacity: delta,
                child: SizedBox.fromSize(
                  size: const Size(70, 40),
                  child: Image.asset(beer.smallImage, fit: BoxFit.contain),
                ),
              );
            },
          ),
        ),
        AnimatedBuilder(
          animation: pageController,
          builder: (_, __) {
            var value = 1.0;
            if (pageController.position.haveDimensions) {
              value = (pageController.page ?? 0) - index;
              value = Curves.easeOut.transform(
                (1 - (value.abs() * .5)).clamp(0, 1),
              );
            }

            return Center(
              child: SizedBox.fromSize(
                size: Size(250, value * 350),
                child: Image.asset(beer.bottleImage, fit: BoxFit.fitHeight),
              ),
            );
          },
        ),
      ],
    );
  }
}
