import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class CardForm extends StatelessWidget {
  const CardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Responsive().setHeight(350),
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
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Login',
              style: GoogleFonts.mulish(
                fontSize: Responsive().setSp(35),
                letterSpacing: .6,
              ),
            ),
            SizedBox(height: Responsive().setHeight(20)),
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
            SizedBox(height: Responsive().setHeight(40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Forgot password',
                  style: GoogleFonts.mulish(
                    color: Colors.blue,
                    fontSize: Responsive().setSp(20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
