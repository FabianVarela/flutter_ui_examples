import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/model/adidas_model.dart';
import 'package:google_fonts/google_fonts.dart';

part 'widget/adidas_description.dart';

part 'widget/color_list_section.dart';

part 'widget/price_section.dart';

part 'widget/quantity_section.dart';

part 'widget/size_list_section.dart';

part 'widget/top_section.dart';

part 'widget/clipper/adidas_clipper.dart';

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
              fontSize: 20,
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
              _TopSection(image: adidasModel.image, rating: adidasModel.rating),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _AdidasDescription(description: adidasModel.description),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _SizeSection(sizes: adidasModel.sizes),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: _QuantitySection(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _ColorListSection(colors: adidasModel.colors),
                    _PriceSection(price: adidasModel.price),
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
