part of '../login_ui.dart';

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .end,
      children: <Widget>[
        const Gap(20),
        Assets.images.login.loginImage01.image(),
        const Expanded(child: Offstage()),
        const Gap(20),
        Assets.images.login.loginImage02.image(),
      ],
    );
  }
}
