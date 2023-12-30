import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_shopping/model/shopping_model.dart';
import 'package:flutter_ui_examples/ui_shopping/widget/custom_icon.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.shopping, super.key});

  final ShoppingModel shopping;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Responsive().setHeight(330),
      decoration: BoxDecoration(
        color: shopping.color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(.3), width: .2),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: Responsive().setHeight(8)),
          Image.asset(
            shopping.image,
            width: Responsive().setWidth(201),
            height: Responsive().setHeight(191),
          ),
          Text(
            shopping.title,
            style: GoogleFonts.ubuntu(fontSize: Responsive().setSp(25)),
          ),
          SizedBox(height: Responsive().setHeight(15)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive().setWidth(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(CustomIcon.favorite),
                  onPressed: () {},
                ),
                Column(
                  children: <Widget>[
                    Text(
                      shopping.originalPrice,
                      style: GoogleFonts.varelaRound(
                        color: const Color(0xFFFEB0BA),
                        fontSize: Responsive().setSp(16),
                      ),
                    ),
                    SizedBox(height: Responsive().setHeight(12)),
                    Text(
                      shopping.discountPrice,
                      style: GoogleFonts.varelaRound(
                        fontSize: Responsive().setSp(28),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(CustomIcon.cart),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
