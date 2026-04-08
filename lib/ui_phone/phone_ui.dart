import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/ui_phone/dial_widget.dart';

class PhoneUI extends StatelessWidget {
  const PhoneUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return const RotaryPasscodeScreen();

    /*
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const .only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: onPressedMenu,
          ),
        ),
      ),
      body: const PhoneRingDial(),
    );
    */
  }
}
