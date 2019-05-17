import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_examples/login/card_form.dart';
import 'package:flutter_ui_examples/login/custom_icon.dart';
import 'package:flutter_ui_examples/login/social_icons.dart';
import 'package:flutter_ui_examples/shopping/shopping_ui.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
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
            fontFamily: "Muli",
          ),
        ),
      ],
    );
  }

  Widget _horizontalLine() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: ScreenUtil.getInstance().setWidth(120),
        height: 1,
        color: Colors.black26.withOpacity(.2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset("assets/images/login_image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset("assets/images/login_image_02.png")
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 28, top: 60),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/login_logo.png",
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                      ),
                      Text(
                        "LOGO",
                        style: TextStyle(
                          fontFamily: "Muli",
                          fontSize: ScreenUtil.getInstance().setSp(46),
                          letterSpacing: .6,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(180),
                  ),
                  CardForm(),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: 12),
                          GestureDetector(
                            onTap: _radio,
                            child: _radioButton(_isSelected, "Remember me"),
                          ),
                        ],
                      ),
                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xFF17EAD9),
                              Color(0xFF6078EA),
                            ]),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF6078EA).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8,
                              )
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShoppingUI()),
                                  ),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Muli",
                                    fontSize: 18,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _horizontalLine(),
                      Text(
                        "Social login",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Muli",
                        ),
                      ),
                      _horizontalLine()
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcons(
                        colors: [
                          Color(0xFF102397),
                          Color(0xFF187ADF),
                          Color(0xFF00EAF8),
                        ],
                        iconData: CustomIcon.facebook,
                        onPressed: () {},
                      ),
                      SocialIcons(
                        colors: [
                          Color(0xFFFF4F38),
                          Color(0xFFFF355D),
                        ],
                        iconData: CustomIcon.google,
                        onPressed: () {},
                      ),
                      SocialIcons(
                        colors: [
                          Color(0xFF17EAD9),
                          Color(0xFF6078EA),
                        ],
                        iconData: CustomIcon.twitter,
                        onPressed: () {},
                      ),
                      SocialIcons(
                        colors: [
                          Color(0xFF00C6FB),
                          Color(0xFF005BEA),
                        ],
                        iconData: CustomIcon.linkedin,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "New User? ",
                        style: TextStyle(fontFamily: "Muli"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xFF5D74E3),
                            fontFamily: "Muli",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(20),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
