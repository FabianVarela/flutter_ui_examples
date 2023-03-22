import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_on_boarding/page_indicator.dart';
import 'package:flutter_ui_examples/ui_on_boarding/page_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OnBoardingUI extends StatefulWidget {
  @override
  _OnBoardingUIState createState() => _OnBoardingUIState();
}

class _OnBoardingUIState extends State<OnBoardingUI>
    with TickerProviderStateMixin {
  late PageController _pageController;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

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

    _scaleAnimation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(_animationController);
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
          colors: <Color>[Color(0xFF485563), Color(0xFF29323C)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          stops: <double>[0.0, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _setPageView(),
            _setPageIndicator(),
            _setFloatingButton(),
          ],
        ),
      ),
    );
  }

  Widget _setPageView() {
    return PageView.builder(
      itemCount: pageList.length,
      controller: _pageController,
      onPageChanged: _changePage,
      itemBuilder: (_, int index) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AnimatedBuilder(
              animation: _pageController,
              builder: (_, Widget? child) {
                final PageModel pageModel = pageList[index];

                double delta;
                double y = 1.0;

                if (_pageController.position.haveDimensions) {
                  delta = (_pageController.page ?? 0) - index;
                  y = 1 - delta.abs().clamp(0.0, 1.0);
                }

                return _setPageContent(pageModel, y);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _setPageContent(PageModel pageModel, double y) {
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
            transform: Matrix4.translationValues(0.0, 50 * (1 - y), 0.0),
            child: Text(
              pageModel.body,
              style: GoogleFonts.montserrat(
                fontSize: Responsive().setSp(20),
                fontWeight: FontWeight.w500,
                color: Color(0xFF9B9B9B),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _setPageIndicator() {
    return Positioned(
      left: Responsive().setWidth(30),
      bottom: Responsive().setHeight(30),
      child: Container(
        width: Responsive().setWidth(160),
        child: PageIndicator(_currentPage, pageList.length),
      ),
    );
  }

  Widget _setFloatingButton() {
    return Positioned(
      right: Responsive().setWidth(30),
      bottom: Responsive().setHeight(30),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: _isLastPage
            ? FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward, color: Colors.black),
                onPressed: () => Navigator.pushNamed(context, '/login'),
              )
            : Container(),
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
