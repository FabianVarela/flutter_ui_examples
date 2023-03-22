import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_streaming/widget/my_clipper.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({required this.image, required this.title, super.key});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive().setHeight(400),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: Responsive().setHeight(370),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: Responsive().setHeight(100),
                      left: Responsive().setWidth(90),
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[Color(0x00000000), Color(0xD9333333)],
                        stops: <double>[0, 0.9],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomLeft,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'WATCH BEFORE EVERYONE',
                          style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: Responsive().setSp(15),
                          ),
                        ),
                        Text(
                          title,
                          style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: Responsive().setSp(35),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Responsive().setHeight(360),
            right: Responsive().setWidth(-30),
            child: FractionalTranslation(
              translation: const Offset(0, -.5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.add, color: Color(0xFFE52020)),
                    onPressed: () {},
                  ),
                  SizedBox(width: Responsive().setWidth(12)),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE52020),
                        padding: EdgeInsets.symmetric(
                          vertical: Responsive().setHeight(15),
                          horizontal: Responsive().setWidth(80),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      label: Text(
                        'Watch now',
                        style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontSize: Responsive().setSp(15),
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
