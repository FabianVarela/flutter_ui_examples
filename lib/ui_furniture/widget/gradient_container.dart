import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: Responsive().setWidth(Responsive().width * .8),
        height: Responsive().setHeight(Responsive().height / 2),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFFFBFCFD),
              Color(0xFFF2F3F8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
