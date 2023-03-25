import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: Responsive().setHeight(20)),
          child: Image.asset('assets/images/login/login_image_01.png'),
        ),
        const Expanded(child: Offstage()),
        Padding(
          padding: EdgeInsets.only(top: Responsive().setHeight(20)),
          child: Image.asset('assets/images/login/login_image_02.png'),
        ),
      ],
    );
  }
}
