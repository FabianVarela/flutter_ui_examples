part of '../login_ui.dart';

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Assets.images.login.loginImage01.image(),
        ),
        const Expanded(child: Offstage()),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Assets.images.login.loginImage02.image(),
        ),
      ],
    );
  }
}
