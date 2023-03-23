import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/model/adidas_model.dart';
import 'package:google_fonts/google_fonts.dart';

class TopSection extends StatelessWidget {
  const TopSection({required this.image, required this.rating, super.key});

  final String image;
  final AdidasRating rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Responsive().setHeight(300),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Responsive().setHeight(60),
                  right: Responsive().setWidth(35),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: Responsive().setWidth(50),
                    height: Responsive().setHeight(50),
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/adidas/360.png'),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: Responsive().setWidth(18),
            bottom: Responsive().setHeight(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: Responsive().setHeight(8)),
                  child: Text(
                    'Rating',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF949598),
                      fontSize: Responsive().setSp(14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.star, color: Color(0xFFFFE600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        '${rating.value}',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFFFFE600),
                          fontSize: Responsive().setSp(16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        '(${rating.voted} people)',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Responsive().setSp(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
