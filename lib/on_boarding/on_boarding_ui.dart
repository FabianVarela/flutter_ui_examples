import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/on_boarding/data.dart';
import 'package:flutter_ui_examples/on_boarding/page_indicator.dart';
import 'package:gradient_text/gradient_text.dart';

class OnBoardingUI extends StatefulWidget {
  @override
  _OnBoardingUIState createState() => _OnBoardingUIState();
}

class _OnBoardingUIState extends State<OnBoardingUI>
    with TickerProviderStateMixin {
  PageController _pageController;
  AnimationController _animationController;
  Animation<double> _scaleAnimation;

  int _currentPage = 0;
  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF485563), Color(0xFF29323C)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          stops: [0.0, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _pageController,
              onPageChanged: _changePage,
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        var page = pageList[index];

                        var delta;
                        var y = 1.0;

                        if (_pageController.position.haveDimensions) {
                          delta = _pageController.page - index;
                          y = 1 - delta.abs().clamp(0.0, 1.0);
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(page.imageUrl),
                            Container(
                              height: 100,
                              margin: EdgeInsets.only(left: 12),
                              child: Stack(
                                children: <Widget>[
                                  Opacity(
                                    opacity: .10,
                                    child: GradientText(
                                      page.title,
                                      gradient: LinearGradient(
                                        colors: page.titleGradient,
                                      ),
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontFamily: "MontserratBlack",
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30, left: 22),
                                    child: GradientText(
                                      page.title,
                                      gradient: LinearGradient(
                                        colors: page.titleGradient,
                                      ),
                                      style: TextStyle(
                                        fontSize: 60,
                                        fontFamily: "MontserratBlack",
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12, left: 34),
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    0.0, 50 * (1 - y), 0.0),
                                child: Text(
                                  page.body,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "MontserratMedium",
                                    color: Color(0xFF9B9B9B),
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
              },
            ),
            Positioned(
              left: 30,
              bottom: 30,
              child: Container(
                width: 160,
                child: PageIndicator(_currentPage, pageList.length),
              ),
            ),
            Positioned(
              right: 30,
              bottom: 30,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: _isLastPage
                    ? FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentPage = index;

      if (_currentPage == pageList.length - 1) {
        _isLastPage = true;
        _animationController.forward();
      } else {
        _isLastPage = false;
        _animationController.reset();
      }
    });
  }
}
