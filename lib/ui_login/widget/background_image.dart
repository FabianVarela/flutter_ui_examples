part of '../login_ui.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset('assets/images/login/login_image_01.png'),
        ),
        const Expanded(child: Offstage()),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset('assets/images/login/login_image_02.png'),
        ),
      ],
    );
  }
}
