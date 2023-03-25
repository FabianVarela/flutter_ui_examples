import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({
    required this.title,
    required this.message,
    required this.tagColor,
    super.key,
  });

  final String title;
  final String message;
  final Color tagColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Responsive().setWidth(20)),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size.zero,
              backgroundColor: tagColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Responsive().setWidth(22),
                vertical: Responsive().setHeight(6),
              ),
            ),
            child: Text(
              title,
              style: GoogleFonts.ubuntu(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Responsive().setWidth(15)),
            child: Text(
              message,
              style: GoogleFonts.ubuntu(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
