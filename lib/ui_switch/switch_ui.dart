import 'dart:ui';

import 'package:flutter/material.dart';

part 'widget/switch_animation.dart';

part 'widget/switch_circular_animation.dart';

class SwitchUI extends StatelessWidget {
  const SwitchUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch animations'),
        leading: Padding(
          padding: const .only(left: 20),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: onPressedMenu,
          ),
        ),
      ),
      body: const Center(
        child: Column(
          spacing: 50,
          mainAxisAlignment: .center,
          children: <Widget>[
            SwitchAnimation(),
            SwitchCircularAnimation(),
          ],
        ),
      ),
    );
  }
}
