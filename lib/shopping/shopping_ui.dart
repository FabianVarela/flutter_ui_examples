import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/custom_drawer.dart';
import 'product_card.dart';
import 'custom_icon.dart';

class ShoppingUI extends StatefulWidget {
  @override
  _ShoppingUIState createState() => _ShoppingUIState();
}

class _ShoppingUIState extends State<ShoppingUI> {
  int _currentIndex = 0;

  List<Widget> bottomNavIconList = [
    Image.asset(
      "assets/images/store.png",
      width: 35,
      height: 35,
    ),
    Icon(
      CustomIcon.search,
      size: 32,
    ),
    Icon(
      CustomIcon.favorite,
      size: 32,
    ),
    Icon(
      CustomIcon.cart,
      size: 32,
    ),
    Image.asset(
      "assets/images/profile.png",
      width: 35,
      height: 35,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Builder(
                      builder: (context) => IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 25),
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 62,
                          height: 43,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ProductCard(
                0xFFfaecfb,
                "assets/images/shoes_01.png",
                "Hybrid Rocket WNS",
                "\$ 999.0",
                "\$ 749.0",
              ),
              SizedBox(
                height: 32,
              ),
              ProductCard(
                0xFFf8e1da,
                "assets/images/shoes_02.png",
                "Hybrid Runner ARS",
                "\$ 699.0",
                "\$ 599.0",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.065),
            offset: Offset(0.0, -3.0),
            blurRadius: 10,
          ),
        ]),
        child: Row(
          children: bottomNavIconList.map((item) {
            var index = bottomNavIconList.indexOf(item);
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: bottomNavItem(item, index == _currentIndex),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

bottomNavItem(Widget item, bool isSelected) => Container(
      decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black12.withOpacity(.2),
                    offset: Offset(0.0, 5.0),
                    blurRadius: 10,
                  ),
                ]
              : []),
      child: item,
    );
