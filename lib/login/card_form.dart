import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(500),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 15.0),
            blurRadius: 15,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 15.0),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(45),
                fontFamily: "Muli",
                letterSpacing: .6,
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text(
              "Username",
              style: TextStyle(
                fontFamily: "Muli",
                fontSize: ScreenUtil.getInstance().setSp(26),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Set the username",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text(
              "Password",
              style: TextStyle(
                fontFamily: "Muli",
                fontSize: ScreenUtil.getInstance().setSp(26),
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Set the password",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot password",
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: "Muli",
                    fontSize: ScreenUtil.getInstance().setSp(28),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
