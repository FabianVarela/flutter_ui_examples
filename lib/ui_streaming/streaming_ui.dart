import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_streaming/model/streaming_model.dart';
import 'package:flutter_ui_examples/ui_streaming/widget/header_section.dart';
import 'package:flutter_ui_examples/ui_streaming/widget/streaming_list.dart';
import 'package:google_fonts/google_fonts.dart';

class StreamingUI extends StatefulWidget {
  const StreamingUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  _StreamingUIState createState() => _StreamingUIState();
}

class _StreamingUIState extends State<StreamingUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: Responsive().setWidth(20)),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: widget.onPressedMenu,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderSection(
              image: streamingList[0].image,
              title: streamingList[0].title,
            ),
            StreamingList(streamingList: streamingList),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: const Color(0xFFE52020),
        selectedLabelStyle: GoogleFonts.mulish(),
        unselectedLabelStyle: GoogleFonts.mulish(),
        items: const <BottomNavigationBarItem>[
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
          ),
        ],
      ),
    );
  }
}
