import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_on_boarding/model/page_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    required this.pageModel,
    required this.pageController,
    this.index = 0,
    super.key,
  });

  final PageModel pageModel;
  final PageController pageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        AnimatedBuilder(
          animation: pageController,
          builder: (_, __) {
            double delta;
            var y = 1.0;

            if (pageController.position.haveDimensions) {
              delta = (pageController.page ?? 0) - index;
              y = 1 - delta.abs().clamp(0.0, 1.0);
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(pageModel.imageUrl),
                Container(
                  height: Responsive().setHeight(100),
                  margin: EdgeInsets.only(left: Responsive().setWidth(12)),
                  child: Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: .10,
                        child: GradientText(
                          pageModel.title,
                          colors: pageModel.titleGradient,
                          style: GoogleFonts.montserrat(
                            fontSize: Responsive().setSp(80),
                            letterSpacing: 1,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: Responsive().setHeight(30),
                          left: Responsive().setWidth(22),
                        ),
                        child: GradientText(
                          pageModel.title,
                          colors: pageModel.titleGradient,
                          style: GoogleFonts.montserrat(
                            fontSize: Responsive().setSp(60),
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: Responsive().setHeight(12),
                    left: Responsive().setWidth(34),
                  ),
                  child: Transform(
                    transform: Matrix4.translationValues(0, 50 * (1 - y), 0),
                    child: Text(
                      pageModel.body,
                      style: GoogleFonts.montserrat(
                        fontSize: Responsive().setSp(20),
                        fontWeight: FontWeight.w500,
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
