import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_streaming/my_clipper.dart';
import 'package:flutter_ui_examples/ui_streaming/streaming_model.dart';
import 'package:google_fonts/google_fonts.dart';

class StreamingUI extends StatefulWidget {
  StreamingUI({required this.onPressedMenu});

  final VoidCallback onPressedMenu;

  @override
  _StreamingUIState createState() => _StreamingUIState();
}

class _StreamingUIState extends State<StreamingUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _setHeaderSection(),
            _setListSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.mulish(color: Color(0xFFE52020)),
        unselectedLabelStyle: GoogleFonts.mulish(),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFE52020)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          )
        ],
      ),
    );
  }

  Widget _setHeaderSection() {
    return Container(
      height: Responsive().setHeight(400),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: Responsive().setHeight(370),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    streamingList[0].image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0x00000000),
                          Color(0xD9333333),
                        ],
                        stops: <double>[0.0, 0.9],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.0, 1.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: Responsive().setHeight(100),
                        left: Responsive().setWidth(95),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'WATCH BEFORE EVERYONE',
                            style: GoogleFonts.mulish(
                              color: Colors.white,
                              fontSize: Responsive().setSp(15),
                            ),
                          ),
                          Text(
                            streamingList[0].title,
                            style: GoogleFonts.mulish(
                              color: Colors.white,
                              fontSize: Responsive().setSp(40),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive().setWidth(20),
                        vertical: Responsive().setHeight(10),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: widget.onPressedMenu,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Responsive().setHeight(360),
            right: Responsive().setWidth(-30),
            child: FractionalTranslation(
              translation: Offset(0.0, -.5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: Color(0xFFE52020),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: Responsive().setWidth(12)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE52020),
                        padding: EdgeInsets.symmetric(
                          vertical: Responsive().setHeight(15),
                          horizontal: Responsive().setWidth(80),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Watch now',
                            style: GoogleFonts.mulish(
                              color: Colors.white,
                              fontSize: Responsive().setSp(15),
                            ),
                          ),
                          SizedBox(width: Responsive().setWidth(5)),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _setListSection() {
    return Container(
      height: Responsive().setHeight(320),
      margin: EdgeInsets.only(left: Responsive().setWidth(65)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive().setWidth(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Watch now',
                  style: GoogleFonts.mulish(fontSize: Responsive().setSp(22)),
                ),
                TextButton(
                  child: Text('View more'),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            height: Responsive().setHeight(250),
            child: ListView.builder(
              itemCount: streamingList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Responsive().setHeight(25),
                    horizontal: Responsive().setWidth(12),
                  ),
                  child: Card(
                    elevation: 10,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: Responsive().setHeight(220),
                      width: Responsive().setWidth(135),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            streamingList[index].image,
                            width: double.infinity,
                            height: Responsive().setHeight(150),
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              streamingList[index].title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.mulish(
                                fontSize: Responsive().setSp(16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
