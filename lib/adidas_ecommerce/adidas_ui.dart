import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/adidas_ecommerce/product_screen_bottom_part.dart';
import 'package:flutter_ui_examples/adidas_ecommerce/product_screen_top_part.dart';
import 'package:flutter_ui_examples/common/custom_drawer.dart';
import 'utils.dart';

class AdidasUI extends StatefulWidget {
  @override
  _AdidasUIState createState() => _AdidasUIState();
}

class _AdidasUIState extends State<AdidasUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF696D77),
            Color(0xFF292C36),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Builder(
            builder: (context) => IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: screenAwareSize(20, context),
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
          ),
          title: Text(
            "Energy Cloud",
            style: TextStyle(
                color: Colors.white,
                fontSize: screenAwareSize(18, context),
                fontFamily: "MontserratBlack"),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: screenAwareSize(20, context),
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProductScreenTopPart(),
              ProductScreenBottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}
