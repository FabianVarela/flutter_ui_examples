import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/adidas_ecommerce/adidas_ui.dart';
import 'package:flutter_ui_examples/furniture/furniture_ui.dart';
import 'package:flutter_ui_examples/music/music_ui.dart';
import 'package:flutter_ui_examples/streaming/streaming_ui.dart';
import 'package:flutter_ui_examples/ui_shopping/shopping.ui.dart';
import 'package:flutter_ui_examples/ui_story/story.ui.dart';

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
                  'Flutter UI Examples',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text('Shopping UI'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => ShoppingUI(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Story UI'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => StoryUI(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Music UI'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => MusicUI(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Streaming UI'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => StreamingUI(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Furniture UI'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => FurnitureUI(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Adidas e-commerce UI'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => AdidasUI(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
