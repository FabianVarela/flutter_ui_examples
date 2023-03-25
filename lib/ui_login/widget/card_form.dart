import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class CardForm extends StatelessWidget {
  const CardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 15),
            blurRadius: 15,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 15),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: Responsive().setHeight(20)),
              child: Text(
                'Login',
                style: GoogleFonts.mulish(
                  fontSize: Responsive().setSp(35),
                  letterSpacing: .6,
                ),
              ),
            ),
            Text(
              'Username',
              style: GoogleFonts.mulish(fontSize: Responsive().setSp(20)),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Set the username',
                hintStyle: GoogleFonts.mulish(
                  color: Colors.grey,
                  fontSize: Responsive().setSp(14),
                ),
              ),
            ),
            SizedBox(height: Responsive().setHeight(20)),
            Text(
              'Password',
              style: GoogleFonts.mulish(fontSize: Responsive().setSp(20)),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Set the password',
                hintStyle: GoogleFonts.mulish(
                  color: Colors.grey,
                  fontSize: Responsive().setSp(14),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Responsive().setHeight(40)),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot password',
                    style: GoogleFonts.mulish(
                      color: Colors.blue,
                      fontSize: Responsive().setSp(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
