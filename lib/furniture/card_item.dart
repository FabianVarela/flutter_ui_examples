import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final double _height;

  final int _index;
  final String _imageUrl;
  final String _title;
  final String _price;

  CardItem(
    this._height,
    this._index,
    this._imageUrl,
    this._title,
    this._price,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35, bottom: (_height > 600) ? 60 : 40),
      child: SizedBox(
        width: 200,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 45),
              child: Container(
                decoration: BoxDecoration(
                  color: (_index % 2 == 0) ? Colors.white : Color(0xFF2A2D3F),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  _imageUrl,
                  width: (_height > 600) ? 172 : 142,
                  height: (_height > 600) ? 199 : 169,
                ),
                SizedBox(height: (_height > 600) ? 12 : 9),
                Padding(
                  padding: EdgeInsets.all((_height > 600) ? 12 : 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _title,
                        style: TextStyle(
                          fontSize: (_height > 600) ? 16 : 14,
                          fontFamily: "MontserratBlack",
                          color: (_index % 2 == 0)
                              ? Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: (_height > 600) ? 8 : 6),
                      Text(
                        "New Sell",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "MontserratMedium",
                          color: (_index % 2 == 0)
                              ? Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: (_height > 600) ? 50 : 30),
                      Text(
                        "$_price \$",
                        style: TextStyle(
                          fontSize: (_height > 600) ? 30 : 25,
                          fontFamily: "MontserratBold",
                          color: (_index % 2 == 0)
                              ? Color(0xFF2A2D3F)
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
