import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'custom_icon.dart';

class ProductCard extends StatelessWidget {
  ProductCard(this.cardColor, this.imageUrl, this.title, this.previousPrice,
      this.price);

  final Color cardColor;
  final String imageUrl;
  final String title;
  final String previousPrice;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Responsive().setHeight(320),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(.3), width: .2),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: Responsive().setHeight(8)),
          Image.asset(
            imageUrl,
            width: Responsive().setWidth(201),
            height: Responsive().setHeight(191),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: Responsive().setSp(25),
              fontFamily: 'Ubuntu',
            ),
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
                  icon: Icon(CustomIcon.favorite),
                  onPressed: () {},
                ),
                Column(
                  children: <Widget>[
                    Text(
                      previousPrice,
                      style: TextStyle(
                        color: Color(0xFFfeb0ba),
                        fontSize: Responsive().setSp(16),
                        fontFamily: 'VarelaRound',
                      ),
                    ),
                    SizedBox(height: Responsive().setHeight(12)),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: Responsive().setSp(28),
                        fontFamily: 'VarelaRound',
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(CustomIcon.cart),
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
