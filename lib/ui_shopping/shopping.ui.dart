import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/custom_drawer.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_shopping/custom_icon.dart';
import 'product_card.dart';

class ShoppingUI extends StatefulWidget {
  @override
  _ShoppingUIState createState() => _ShoppingUIState();
}

class _ShoppingUIState extends State<ShoppingUI> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    Responsive.init(context,
        width: width, height: height, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive().setWidth(50),
            vertical: Responsive().setHeight(30),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Builder(
                      builder: (BuildContext context) => IconButton(
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
                          'assets/images/logo.png',
                          width: Responsive().setWidth(62),
                          height: Responsive().setHeight(43),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ProductCard(
                Color(0xFFFAECFB),
                'assets/images/shoes_01.png',
                'Hybrid Rocket WNS',
                '\$ 999.0',
                '\$ 749.0',
              ),
              SizedBox(height: Responsive().setHeight(32)),
              ProductCard(
                Color(0xFFF8E1DA),
                'assets/images/shoes_02.png',
                'Hybrid Runner ARS',
                '\$ 699.0',
                '\$ 599.0"',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _setBottomNavigation(),
    );
  }

  Widget _setBottomNavigation() {
    return Container(
      height: Responsive().setHeight(70),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12.withOpacity(0.065),
          offset: Offset(0.0, -3.0),
          blurRadius: 10,
        ),
      ]),
      child: Row(
        children: _bottomNavIconList.map((Widget item) {
          final int index = _bottomNavIconList.indexOf(item);

          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _currentIndex = index),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: index == _currentIndex
                        ? <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12.withOpacity(.2),
                              offset: Offset(0.0, 5.0),
                              blurRadius: 10,
                            ),
                          ]
                        : <BoxShadow>[]),
                child: item,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<Widget> _bottomNavIconList = <Widget>[
    Image.asset('assets/images/store.png', width: 35, height: 35),
    Icon(CustomIcon.search, size: 32),
    Icon(CustomIcon.favorite, size: 32),
    Icon(CustomIcon.cart, size: 32),
    Image.asset('assets/images/profile.png', width: 35, height: 35),
  ];
}
