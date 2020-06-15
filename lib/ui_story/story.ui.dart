import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_story/card_scroll.dart';
import 'package:flutter_ui_examples/ui_story/custom_icon.dart';
import 'package:flutter_ui_examples/ui_story/story_model.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryUI extends StatefulWidget {
  StoryUI({@required this.onPressedMenu});

  final Function onPressedMenu;

  @override
  _StoryUIState createState() => _StoryUIState();
}

class _StoryUIState extends State<StoryUI> {
  PageController _pageController;
  double _currentPage;

  @override
  void initState() {
    super.initState();

    _currentPage = (stories.length - 1).toDouble();

    _pageController = PageController(initialPage: stories.length - 1);
    _pageController.addListener(() {
      setState(() => _currentPage = _pageController.page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF243447),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _setBar(),
            _setTitle('Trending'),
            _setTag(Color(0xFFFF6E6E), 'Animated', '25+ stories'),
            Stack(
              children: <Widget>[
                CardScroll(_currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: stories.length,
                    controller: _pageController,
                    reverse: true,
                    itemBuilder: (_, int index) => Container(),
                  ),
                )
              ],
            ),
            _setTitle('Favourite'),
            _setTag(Colors.blueAccent, 'Latest', '9+ Stories'),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Responsive().setHeight(20),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: Responsive().setWidth(18)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/image_02.jpg',
                        width: Responsive().setWidth(296),
                        height: Responsive().setHeight(222),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Responsive().setWidth(12),
        Responsive().setHeight(30),
        Responsive().setWidth(12),
        Responsive().setHeight(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              CustomIcons.menu,
              color: Colors.white,
              size: 30,
            ),
            onPressed: widget.onPressedMenu,
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _setTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: Responsive().setSp(46),
              letterSpacing: 1,
            ),
          ),
          IconButton(
            icon: Icon(
              CustomIcons.option,
              color: Colors.white,
              size: 12,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _setTag(Color color, String title, String message) {
    return Padding(
      padding: EdgeInsets.only(left: Responsive().setWidth(20)),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive().setWidth(22),
                  vertical: Responsive().setHeight(6),
                ),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(width: Responsive().setWidth(15)),
          Text(
            message,
            style: TextStyle(color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
