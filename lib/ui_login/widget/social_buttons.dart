part of '../login_ui.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[
            SocialIcons(
              colors: const <Color>[Color(0xFF102397), Color(0xFF187ADF)],
              iconData: CustomIcon.facebook,
              onPressed: () {},
            ),
            SocialIcons(
              colors: const <Color>[Color(0xFFFF4F38), Color(0xFFFF355D)],
              iconData: CustomIcon.google,
              onPressed: () {},
            ),
            SocialIcons(
              colors: const <Color>[Color(0xFF17EAD9), Color(0xFF6078EA)],
              iconData: CustomIcon.twitter,
              onPressed: () {},
            ),
            SocialIcons(
              colors: const <Color>[Color(0xFF00C6FB), Color(0xFF005BEA)],
              iconData: CustomIcon.linkedin,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
