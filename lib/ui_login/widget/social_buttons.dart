part of '../login_ui.dart';

class _SocialButtons extends StatelessWidget {
  const _SocialButtons();

  @override
  Widget build(BuildContext context) {
    final socialIconList = <({String icon, List<Color> colors})>[
      (
        icon: Assets.svg.login.facebook,
        colors: const <Color>[Color(0xFF102397), Color(0xFF187ADF)],
      ),
      (
        icon: Assets.svg.login.google,
        colors: const <Color>[Color(0xFFFF4F38), Color(0xFFFF355D)],
      ),
      (
        icon: Assets.svg.login.twitter,
        colors: const <Color>[Color(0xFF17EAD9), Color(0xFF6078EA)],
      ),
      (
        icon: Assets.svg.login.linkedIn,
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
                  color: Colors.black26.withValues(alpha: .2),
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
                  color: Colors.black26.withValues(alpha: .2),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (final (index, item) in socialIconList.indexed) ...[
              _SocialIcons(
                colors: item.colors,
                iconPath: item.icon,
                onPressed: () {},
              ),
              if (index <= socialIconList.length - 1) const Gap(14),
            ],
          ],
        ),
      ],
    );
  }
}

class _SocialIcons extends StatelessWidget {
  const _SocialIcons({
    required this.colors,
    required this.iconPath,
    required this.onPressed,
  });

  final List<Color> colors;
  final String iconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: Colors.black,
        minimumSize: const Size(45, 45),
        padding: const EdgeInsets.all(8),
        shape: const CircleBorder(),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundBuilder: (_, state, child) {
          var opacity = 1.0;
          if (state.contains(WidgetState.disabled)) opacity = .6;

          return Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors.map((e) {
                  return e.withValues(alpha: opacity);
                }).toList(),
              ),
            ),
            child: child,
          );
        },
      ),
      onPressed: onPressed,
      child: VectorGraphic(
        loader: AssetBytesLoader(iconPath),
        colorFilter: ColorFilter.mode(
          onPressed != null ? Colors.white : Colors.white70,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
