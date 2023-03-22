import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_shopping/custom_icon.dart';
import 'package:flutter_ui_examples/ui_shopping/product_card.dart';

class ShoppingUI extends StatefulWidget {
  const ShoppingUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  _ShoppingUIState createState() => _ShoppingUIState();
}

class _ShoppingUIState extends State<ShoppingUI> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: widget.onPressedMenu,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Align(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 25),
                        child: Image.asset(
                          'assets/images/shopping/logo.png',
                          width: Responsive().setWidth(62),
                          height: Responsive().setHeight(43),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const ProductCard(
                Color(0xFFFAECFB),
                'assets/images/shopping/shoes_01.png',
                'Hybrid Rocket WNS',
                r'$ 999.0',
                r'$ 749.0',
              ),
              SizedBox(height: Responsive().setHeight(32)),
              const ProductCard(
                Color(0xFFF8E1DA),
                'assets/images/shopping/shoes_02.png',
                'Hybrid Runner ARS',
                r'$ 699.0',
                r'$ 599.0"',
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
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12.withOpacity(0.065),
            offset: const Offset(0, -3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: _bottomNavIconList.map((item) {
          final index = _bottomNavIconList.indexOf(item);

          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _currentIndex = index),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: index == _currentIndex
                      ? <BoxShadow>[
                          BoxShadow(
                            color: Colors.black12.withOpacity(.2),
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                          ),
                        ]
                      : <BoxShadow>[],
                ),
                child: item,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  final List<Widget> _bottomNavIconList = <Widget>[
    Image.asset('assets/images/shopping/store.png', width: 35, height: 35),
    const Icon(CustomIcon.search, size: 32),
    const Icon(CustomIcon.favorite, size: 32),
    const Icon(CustomIcon.cart, size: 32),
    Image.asset('assets/images/shopping/profile.png', width: 35, height: 35),
  ];
}
