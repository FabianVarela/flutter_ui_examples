import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({@required this.onCloseMenu});

  final Function() onCloseMenu;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.blueGrey,
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _setMenuItem(context, 'Shopping UI', '/shopping'),
              _setMenuItem(context, 'Story UI', '/story'),
              _setMenuItem(context, 'Music UI', '/music'),
              _setMenuItem(context, 'Streaming UI', '/streaming'),
              _setMenuItem(context, 'Furniture UI', '/furniture'),
              _setMenuItem(context, 'Adidas e-commerce UI', '/adidas'),
              _setMenuItem(context, 'Beer UI', '/beer'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _setMenuItem(BuildContext context, String text, String route) {
    return ListTile(
      title: Text(text, style: GoogleFonts.muli(fontSize: 20)),
      onTap: () {
        onCloseMenu();
        Navigator.of(context).pushReplacementNamed(route);
      },
    );
  }
}
