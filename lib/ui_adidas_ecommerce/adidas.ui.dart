import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/model/adidas_model.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/widget/adidas_description.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/widget/color_list_section.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/widget/price_section.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/widget/quantity_section.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/widget/size_list_section.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/widget/top_section.dart';
import 'package:google_fonts/google_fonts.dart';

class AdidasUI extends StatelessWidget {
  const AdidasUI({required this.onPressedMenu, super.key});

  final VoidCallback onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0xFF696D77), Color(0xFF292C36)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, size: 25),
            onPressed: onPressedMenu,
          ),
          title: Text(
            adidasModel.title,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: Responsive().setSp(20),
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.favorite_border, size: 25),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopSection(image: adidasModel.image, rating: adidasModel.rating),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: Responsive().setHeight(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AdidasDescription(description: adidasModel.description),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Responsive().setWidth(15),
                        right: Responsive().setWidth(15),
                        bottom: Responsive().setHeight(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizeSection(sizes: adidasModel.sizes),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: QuantitySection(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ColorListSection(colors: adidasModel.colors),
                    PriceSection(price: adidasModel.price),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
