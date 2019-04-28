import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/adidas_ecommerce/data.dart';
import 'package:flutter_ui_examples/adidas_ecommerce/my_clipper.dart';
import 'package:flutter_ui_examples/adidas_ecommerce/utils.dart';

class ProductScreenBottomPart extends StatefulWidget {
  @override
  _ProductScreenBottomPartState createState() =>
      _ProductScreenBottomPartState();
}

class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool _isExpanded = false;
  int _currentSizeIndex = 0;
  int _quantityValue = 0;
  int _currentColorIndex = 0;

  _expandedText() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  _increase() {
    setState(() {
      _quantityValue++;
    });
  }

  _decrease() {
    setState(() {
      if (_quantityValue > 0) _quantityValue--;
    });
  }

  Widget _sizeItem(String size, bool isSelected, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12),
      child: Container(
        width: screenAwareSize(30, context),
        height: screenAwareSize(30, context),
        decoration: BoxDecoration(
            color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color:
                    isSelected ? Colors.black.withOpacity(.5) : Colors.black12,
                offset: Offset(0.0, 10.0),
                blurRadius: 10,
              )
            ]),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "MontserratBlack",
            ),
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  List<Widget> _colorSelector() {
    List<Widget> colorItemList = List();

    for (int i = 0; i < colors.length; i++) {
      colorItemList
          .add(_colorItem(colors[i], i == _currentColorIndex, context, () {
        setState(() {
          _currentColorIndex = i;
        });
      }));
    }

    return colorItemList;
  }

  Widget _colorItem(
      Color color, bool isSelected, BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: screenAwareSize(10, context)),
        child: Container(
          width: screenAwareSize(30, context),
          height: screenAwareSize(30, context),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(.8),
                      blurRadius: 10,
                      offset: Offset(0.0, 10.0),
                    )
                  ]
                : [],
          ),
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              "Product Description",
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(10, context),
                fontFamily: "MontserratSemibold",
              ),
            ),
          ),
          SizedBox(height: screenAwareSize(8, context)),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(26, context),
              right: screenAwareSize(18, context),
            ),
            child: AnimatedCrossFade(
              firstChild: Text(
                productDescription,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenAwareSize(10, context),
                  fontFamily: "MontserratMedium",
                ),
              ),
              secondChild: Text(
                productDescription,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenAwareSize(10, context),
                  fontFamily: "MontserratMedium",
                ),
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(26, context),
              right: screenAwareSize(18, context),
            ),
            child: GestureDetector(
              child: Text(
                _isExpanded ? "less" : "more...",
                style: TextStyle(
                  color: Color(0xFFFB382F),
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: _expandedText,
            ),
          ),
          SizedBox(height: screenAwareSize(12, context)),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(15, context),
              right: screenAwareSize(65, context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Size",
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "MontserratMedium",
                  ),
                ),
                Text(
                  "Quantity",
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "MontserratMedium",
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(10, context),
              right: screenAwareSize(5, context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: screenAwareSize(38, context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sizeNumList.map((item) {
                      var index = sizeNumList.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentSizeIndex = index;
                          });
                        },
                        child: _sizeItem(
                            item, index == _currentSizeIndex, context),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    width: screenAwareSize(100, context),
                    height: screenAwareSize(30, context),
                    decoration: BoxDecoration(
                      color: Color(0xFF525663),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _decrease,
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "MontserratBlack",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        _divider(),
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: double.infinity,
                            child: Center(
                              child: Text(
                                "$_quantityValue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "MontserratBlack",
                                ),
                              ),
                            ),
                          ),
                        ),
                        _divider(),
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _increase,
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "MontserratBlack",
                                  ),
                                ),
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
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18, context)),
            child: Text(
              "Select Color",
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(10, context),
                fontFamily: "MontserratBlack",
              ),
            ),
          ),
          SizedBox(height: screenAwareSize(8, context)),
          Container(
            width: double.infinity,
            height: screenAwareSize(34, context),
            margin: EdgeInsets.only(left: screenAwareSize(20, context)),
            child: Row(
              children: _colorSelector(),
            ),
          ),
          SizedBox(height: screenAwareSize(12, context)),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(20, context)),
            child: Text(
              "Price",
              style: TextStyle(
                color: Color(0xFF949598),
                fontFamily: "MontserratBlack",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenAwareSize(120, context),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: screenAwareSize(22, context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenAwareSize(18, context),
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "\$",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenAwareSize(26, context),
                                fontFamily: "MontserratMedium",
                              ),
                            ),
                            SizedBox(width: screenAwareSize(2, context)),
                            Text(
                              "80",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenAwareSize(35, context),
                                fontFamily: "MontserratMedium",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenAwareSize(10, context)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          color: Color(0xFFFB382F),
                          padding: EdgeInsets.symmetric(
                            vertical: screenAwareSize(14, context),
                          ),
                          onPressed: () {},
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: screenAwareSize(35, context),
                              ),
                              child: Text(
                                "Add to cart",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(15, context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: -40,
                  bottom: -45,
                  child: Image.asset(
                    "assets/images/cart.png",
                    width: screenAwareSize(190, context),
                    height: screenAwareSize(155, context),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
