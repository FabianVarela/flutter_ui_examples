import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/provider/simple_hidden_drawer_provider.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
              _setMenuItem(context, 'Shopping UI', 0),
              _setMenuItem(context, 'Story UI', 1),
              _setMenuItem(context, 'Music UI', 2),
              _setMenuItem(context, 'Streaming UI', 3),
              _setMenuItem(context, 'Furniture UI', 4),
              _setMenuItem(context, 'Adidas e-commerce UI', 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _setMenuItem(BuildContext context, String text, int position) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Muli',
        ),
      ),
      onTap: () => SimpleHiddenDrawerProvider.of(context)
          .setSelectedMenuPosition(position),
    );
  }
}
