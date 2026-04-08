import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'widgets/dial_widget.dart';

part 'widgets/phone_circle_painter.dart';

class PhoneUI extends StatelessWidget {
  const PhoneUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: RotaryPasscodeWidget(
          passcode: '1234',
          onSuccess: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✓ Access granted'),
              backgroundColor: Colors.lightGreen,
            ),
          ),
          onFailure: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✓ Access denied'),
              backgroundColor: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}
