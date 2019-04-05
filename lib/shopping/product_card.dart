import 'package:flutter/material.dart';
import 'custom_icon.dart';

class ProductCard extends StatelessWidget {
  int cardColor;
  String imageUrl;
  String title;
  String previousPrice;
  String price;

  ProductCard(this.cardColor, this.imageUrl, this.title, this.previousPrice,
      this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      decoration: BoxDecoration(
        color: Color(cardColor),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(.3),
          width: .2,
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Image.asset(
            imageUrl,
            width: 201,
            height: 191,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontFamily: "Ubuntu",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
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
                        fontSize: 16,
                        fontFamily: "VarelaRound",
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: "VarelaRound",
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
