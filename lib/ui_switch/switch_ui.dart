import 'dart:ui';

import 'package:material_ui/material_ui.dart';

part 'widget/switch_animation.dart';

part 'widget/switch_circular_animation.dart';

class SwitchUI extends StatelessWidget {
  const new({required this.onPressedMenu, super.key});

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
          children: <Widget>[SwitchAnimation(), SwitchCircularAnimation()],
        ),
      ),
    );
  }
}
