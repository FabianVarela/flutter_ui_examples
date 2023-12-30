import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/ui_login/widget/custom_icon.dart';
import 'package:flutter_ui_examples/ui_login/widget/social_icons.dart';
import 'package:google_fonts/google_fonts.dart';

part 'widget/background_image.dart';

part 'widget/card_form.dart';

part 'widget/sign_in_buttons.dart';

part 'widget/social_buttons.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const BackgroundImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/images/login/login_logo.png',
                    width: 70,
                    height: 70,
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: CardForm(),
                  ),
                  SignInButtons(
                    onSignIn: () {
                      Navigator.pushReplacementNamed(context, '/shopping');
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: SocialButtons(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.mulish(color: Colors.black),
                          children: <TextSpan>[
                            const TextSpan(text: 'New User? '),
                            TextSpan(
                              text: 'Sign Up',
                              style: const TextStyle(color: Color(0xFF5D74E3)),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
