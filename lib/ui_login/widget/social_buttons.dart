part of '../login_ui.dart';

class _SocialButtons extends StatelessWidget {
  const _SocialButtons();

  @override
  Widget build(BuildContext context) {
    Assets.images.login.facebook.svg();
    final socialIconList = <({SvgGenImage icon, List<Color> colors})>[
      (
        icon: Assets.images.login.facebook,
        colors: const <Color>[Color(0xFF102397), Color(0xFF187ADF)],
      ),
      (
        icon: Assets.images.login.google,
        colors: const <Color>[Color(0xFFFF4F38), Color(0xFFFF355D)],
      ),
      (
        icon: Assets.images.login.twitter,
        colors: const <Color>[Color(0xFF17EAD9), Color(0xFF6078EA)],
      ),
      (
        icon: Assets.images.login.linkedIn,
        colors: const <Color>[Color(0xFF00C6FB), Color(0xFF005BEA)],
      ),
    ];

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 85,
                child: Divider(
                  height: 1,
                  color: Colors.black26.withOpacity(.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Social login',
                  style: GoogleFonts.mulish(fontSize: 16),
                ),
              ),
              SizedBox(
                width: 85,
                child: Divider(
                  height: 1,
                  color: Colors.black26.withOpacity(.2),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: socialIconList.map((socialIcon) {
            return _SocialIcons(
              colors: socialIcon.colors,
              icon: socialIcon.icon.svg(
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {},
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SocialIcons extends StatelessWidget {
  const _SocialIcons({
    required this.colors,
    required this.icon,
    required this.onPressed,
  });

  final List<Color> colors;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: SizedBox.fromSize(
        size: const Size(45, 45),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: colors),
          ),
          child: RawMaterialButton(
            padding: const EdgeInsets.all(8),
            shape: const CircleBorder(),
            onPressed: onPressed,
            child: icon,
          ),
        ),
      ),
    );
  }
}
