import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/adidas_ecommerce/adidas_ui.dart';
import 'package:flutter_ui_examples/furniture/furniture_ui.dart';
import 'package:flutter_ui_examples/music/music_ui.dart';
import 'package:flutter_ui_examples/shopping/shopping_ui.dart';
import 'package:flutter_ui_examples/story/story_ui.dart';
import 'package:flutter_ui_examples/streaming/streaming_ui.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/flutter_logo.png',
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
                SizedBox(height: 15),
                Text(
                  "Flutter UI Examples",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text("Shopping UI"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShoppingUI()),
              );
            },
          ),
          ListTile(
            title: Text("Story UI"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => StoryUI()),
              );
            },
          ),
          ListTile(
            title: Text("Music UI"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MusicUI()),
              );
            },
          ),
          ListTile(
            title: Text("Streaming UI"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => StreamingUI()),
              );
            },
          ),
          ListTile(
            title: Text("Furniture UI"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FurnitureUI()),
              );
            },
          ),
          ListTile(
            title: Text("Adidas e-commerce UI"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AdidasUI()),
              );
            },
          ),
        ],
      ),
    );
  }
}
