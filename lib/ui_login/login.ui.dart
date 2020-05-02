import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_login/card_form.dart';
import 'package:flutter_ui_examples/ui_login/custom_icon.dart';
import 'package:flutter_ui_examples/ui_login/social_icons.dart';
import 'package:flutter_ui_examples/ui_shopping/shopping.ui.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    Responsive.init(context,
        width: width, height: height, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _setBackgroundImages(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 28, top: 60),
              child: Column(
                children: <Widget>[
                  _setLogoImages(),
                  SizedBox(height: Responsive().setHeight(120)),
                  CardForm(),
                  SizedBox(height: Responsive().setHeight(20)),
                  _setSignIn(),
                  SizedBox(height: Responsive().setHeight(30)),
                  _setSocialTitle(),
                  SizedBox(height: Responsive().setHeight(30)),
                  _socialIcons(),
                  SizedBox(height: Responsive().setHeight(30)),
                  _setSignUp(),
                  SizedBox(height: Responsive().setHeight(20))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _setBackgroundImages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: Responsive().setHeight(20)),
          child: Image.asset('assets/images/login_image_01.png'),
        ),
        Expanded(child: Container()),
        Padding(
          padding: EdgeInsets.only(top: Responsive().setHeight(20)),
          child: Image.asset('assets/images/login_image_02.png'),
        ),
      ],
    );
  }

  Widget _setLogoImages() {
    return Row(
      children: <Widget>[
        Image.asset(
          'assets/images/login_logo.png',
          width: Responsive().setWidth(70),
          height: Responsive().setHeight(70),
        ),
        Text(
          'LOGO',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: Responsive().setSp(30),
            letterSpacing: .6,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _setSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 12),
            GestureDetector(
              onTap: () => setState(() => _isSelected = !_isSelected),
              child: _radioButton(_isSelected, 'Remember me'),
            ),
          ],
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<dynamic>(builder: (_) => ShoppingUI()),
          ),
          child: Container(
            width: Responsive().setWidth(200),
            height: Responsive().setHeight(60),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color(0xFF17EAD9),
                Color(0xFF6078EA),
              ]),
              borderRadius: BorderRadius.circular(6),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color(0xFF6078EA).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Muli',
                  fontSize: Responsive().setSp(18),
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _radioButton(bool isSelected, String text) {
    return Row(
      children: <Widget>[
        Container(
          width: 16,
          height: 16,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: isSelected
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                )
              : Container(),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Muli',
          ),
        ),
      ],
    );
  }

  Widget _setSocialTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _horizontalLine(),
        Text(
          'Social login',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Muli',
          ),
        ),
        _horizontalLine()
      ],
    );
  }

  Widget _horizontalLine() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: Responsive().setWidth(85),
        height: 1,
        color: Colors.black26.withOpacity(.2),
      ),
    );
  }

  Widget _socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialIcons(
          colors: <Color>[
            Color(0xFF102397),
            Color(0xFF187ADF),
            Color(0xFF00EAF8),
          ],
          iconData: CustomIcon.facebook,
          onPressed: () {},
        ),
        SocialIcons(
          colors: <Color>[
            Color(0xFFFF4F38),
            Color(0xFFFF355D),
          ],
          iconData: CustomIcon.google,
          onPressed: () {},
        ),
        SocialIcons(
          colors: <Color>[
            Color(0xFF17EAD9),
            Color(0xFF6078EA),
          ],
          iconData: CustomIcon.twitter,
          onPressed: () {},
        ),
        SocialIcons(
          colors: <Color>[
            Color(0xFF00C6FB),
            Color(0xFF005BEA),
          ],
          iconData: CustomIcon.linkedin,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _setSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'New User? ',
          style: TextStyle(fontFamily: 'Muli'),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xFF5D74E3),
              fontFamily: 'Muli',
            ),
          ),
        ),
      ],
    );
  }
}
