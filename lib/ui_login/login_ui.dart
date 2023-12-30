import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_login/widget/background_image.dart';
import 'package:flutter_ui_examples/ui_login/widget/card_form.dart';
import 'package:flutter_ui_examples/ui_login/widget/sign_in_buttons.dart';
import 'package:flutter_ui_examples/ui_login/widget/social_buttons.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const BackgroundImage(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive().setHeight(20),
              vertical: Responsive().setHeight(60),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/login/login_logo.png',
                  width: Responsive().setWidth(70),
                  height: Responsive().setHeight(70),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Responsive().setHeight(120)),
                  child: const CardForm(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Responsive().setHeight(20)),
                  child: SignInButtons(
                    onSignIn: () {
                      Navigator.pushReplacementNamed(context, '/shopping');
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Responsive().setHeight(30)),
                  child: const SocialButtons(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Responsive().setHeight(20)),
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
        ],
      ),
    );
  }
}
