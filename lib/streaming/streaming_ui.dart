import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/custom_drawer.dart';
import 'package:flutter_ui_examples/streaming/home_screen_bottom.dart';
import 'package:flutter_ui_examples/streaming/home_screen_top.dart';

class StreamingUI extends StatefulWidget {
  @override
  _StreamingUIState createState() => _StreamingUIState();
}

class _StreamingUIState extends State<StreamingUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[HomeScreenTopPart(), HomeScreenBottomPart()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xFFE52020),
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Color(0xFFE52020)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text("Bookmarks"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("Profile"),
          )
        ],
      ),
    );
  }
}
