import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/adidas_ecommerce/utils.dart';

class ProductScreenTopPart extends StatefulWidget {
  @override
  _ProductScreenTopPartState createState() => _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(245, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/images/adidas.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60, right: 35),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(50, context),
                    height: screenAwareSize(50, context),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/images/360.png"),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: screenAwareSize(18, context),
            bottom: screenAwareSize(15, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Rating",
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "MontserratMedium",
                  ),
                ),
                SizedBox(height: screenAwareSize(8, context)),
                Row(
                  children: <Widget>[
                    SizedBox(width: 8),
                    Icon(Icons.star, color: Color(0xFFFFE600)),
                    SizedBox(width: screenAwareSize(5, context)),
                    Text("4.5", style: TextStyle(color: Color(0xFFFFE600))),
                    SizedBox(width: screenAwareSize(5, context)),
                    Text(
                      "(478 people)",
                      style: TextStyle(color: Colors.white, fontSize: 14),
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
