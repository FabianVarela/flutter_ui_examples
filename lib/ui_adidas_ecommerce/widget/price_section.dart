import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({required this.price, super.key});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: Responsive().setWidth(20),
          ),
          child: Text(
            'Price',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF949598),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: Responsive().setHeight(180),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: Responsive().setWidth(22)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: Responsive().setWidth(18),
                        bottom: Responsive().setHeight(10),
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: r'$ ',
                              style: TextStyle(
                                fontSize: Responsive().setSp(26),
                              ),
                            ),
                            TextSpan(
                              text: '$price',
                              style: TextStyle(
                                fontSize: Responsive().setSp(35),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFB382F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: Responsive().setHeight(14),
                          horizontal: Responsive().setWidth(35),
                        ),
                      ),
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Add to cart',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: Responsive().setSp(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: Responsive().setWidth(-40),
                bottom: Responsive().setHeight(0),
                child: Image.asset(
                  'assets/images/adidas/cart.png',
                  width: Responsive().setWidth(190),
                  height: Responsive().setHeight(155),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
