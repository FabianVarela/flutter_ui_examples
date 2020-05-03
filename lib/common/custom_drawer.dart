import 'package:flutter/material.dart';

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
            onTap: () => Navigator.pushReplacementNamed(context, '/shopping'),
          ),
          ListTile(
            title: Text('Story UI'),
            onTap: () => Navigator.pushReplacementNamed(context, '/story'),
          ),
          ListTile(
            title: Text('Music UI'),
            onTap: () => Navigator.pushReplacementNamed(context, '/music'),
          ),
          ListTile(
            title: Text('Streaming UI'),
            onTap: () => Navigator.pushReplacementNamed(context, '/streaming'),
          ),
          ListTile(
            title: Text('Furniture UI'),
            onTap: () => Navigator.pushReplacementNamed(context, '/furniture'),
          ),
          ListTile(
            title: Text('Adidas e-commerce UI'),
            onTap: () => Navigator.pushReplacementNamed(context, '/e-commerce'),
          ),
        ],
      ),
    );
  }
}
