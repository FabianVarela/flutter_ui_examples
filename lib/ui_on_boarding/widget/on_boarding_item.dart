part of '../on_boarding_ui.dart';

class _OnboardingItem extends StatelessWidget {
  const _OnboardingItem({
    required this.pageModel,
    required this.pageController,
    this.index = 0,
  });

  final PageModel pageModel;
  final PageController pageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: .expand,
      children: <Widget>[
        AnimatedBuilder(
          animation: pageController,
          builder: (_, _) {
            var delta = 1.0;
            if (pageController.position.haveDimensions) {
              final resultPage = (pageController.page ?? 0) - index;
              delta = 1 - resultPage.abs().clamp(0.0, 1.0);
            }
            final yValue = 50 * (1 - delta);

            return Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: <Widget>[
                Image.asset(pageModel.imageUrl),
                Container(
                  height: 100,
                  margin: const .only(left: 12),
                  child: Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: .10,
                        child: GradientText(
                          pageModel.title,
                          colors: pageModel.titleGradient,
                          style: GoogleFonts.montserrat(
                            fontSize: 80,
                            letterSpacing: 1,
                            fontWeight: .w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const .only(top: 30, left: 22),
                        child: GradientText(
                          pageModel.title,
                          colors: pageModel.titleGradient,
                          style: GoogleFonts.montserrat(
                            fontSize: 60,
                            fontWeight: .w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const .only(top: 12, left: 34),
                  child: Transform(
                    transform: .translationValues(0, yValue, 0),
                    child: Text(
                      pageModel.body,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: .w500,
                        color: const Color(0xFF9B9B9B),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
