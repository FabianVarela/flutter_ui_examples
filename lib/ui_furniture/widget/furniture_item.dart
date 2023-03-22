import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureItem extends StatelessWidget {
  const FurnitureItem({
    required this.image,
    required this.title,
    required this.price,
    this.currentIndex = 0,
    super.key,
  });

  final String image;
  final String title;
  final String price;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Responsive().setWidth(35),
        bottom: Responsive().setHeight(50),
      ),
      child: SizedBox(
        width: Responsive().setWidth(200),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: Responsive().setHeight(45)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: currentIndex.isEven
                      ? Colors.white
                      : const Color(0xFF2A2D3F),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 10),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  image,
                  width: Responsive().setWidth(172),
                  height: Responsive().setHeight(199),
                ),
                SizedBox(height: Responsive().setHeight(12)),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: GoogleFonts.montserrat(
                          fontSize: Responsive().setSp(16),
                          fontWeight: FontWeight.w900,
                          color: currentIndex.isEven
                              ? const Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: Responsive().setHeight(7)),
                      Text(
                        'New Sell',
                        style: GoogleFonts.montserrat(
                          fontSize: Responsive().setSp(12),
                          fontWeight: FontWeight.w500,
                          color: currentIndex.isEven
                              ? const Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: Responsive().setHeight(45)),
                      Text(
                        '$price \$',
                        style: GoogleFonts.montserrat(
                          fontSize: Responsive().setSp(30),
                          fontWeight: FontWeight.w700,
                          color: currentIndex.isEven
                              ? const Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                    ],
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
