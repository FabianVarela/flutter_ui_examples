import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    required this.onRedirect,
    required this.onCloseMenu,
    this.isShowing = false,
    super.key,
  });

  final ValueSetter<String> onRedirect;
  final VoidCallback onCloseMenu;
  final bool isShowing;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.blueGrey,
        padding: const EdgeInsets.all(8),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: isShowing ? 1 : 0,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _MenuItem(
                  text: 'Shopping UI',
                  onTap: () => _redirectTo(context, '/shopping'),
                ),
                _MenuItem(
                  text: 'Story UI',
                  onTap: () => _redirectTo(context, '/story'),
                ),
                _MenuItem(
                  text: 'Music UI',
                  onTap: () => _redirectTo(context, '/music'),
                ),
                _MenuItem(
                  text: 'Streaming UI',
                  onTap: () => _redirectTo(context, '/streaming'),
                ),
                _MenuItem(
                  text: 'Furniture UI',
                  onTap: () => _redirectTo(context, '/furniture'),
                ),
                _MenuItem(
                  text: 'Adidas e-commerce UI',
                  onTap: () => _redirectTo(context, '/adidas'),
                ),
                _MenuItem(
                  text: 'Sneaky UI',
                  onTap: () => _redirectTo(context, '/sneaky'),
                ),
                _MenuItem(
                  text: 'Beer UI',
                  onTap: () => _redirectTo(context, '/beer'),
                ),
                _MenuItem(
                  text: 'Ice Cream UI',
                  onTap: () => _redirectTo(context, '/ice_cream'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _redirectTo(BuildContext context, String route) {
    onCloseMenu();
    onRedirect(route);
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: GoogleFonts.mulish(fontSize: 20)),
      onTap: onTap,
    );
  }
}
