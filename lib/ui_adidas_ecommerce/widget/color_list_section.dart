import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_adidas_ecommerce/widget/my_clipper.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorListSection extends HookWidget {
  const ColorListSection({required this.colors, super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final currentColor = useState<int?>(null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: Responsive().setWidth(18),
            bottom: Responsive().setHeight(10),
          ),
          child: Text(
            'Select Color',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF949598),
              fontSize: Responsive().setSp(14),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: Responsive().setHeight(34),
          margin: EdgeInsets.only(
            left: Responsive().setWidth(20),
            bottom: Responsive().setHeight(20),
          ),
          child: Row(
            children: <Widget>[
              for (var i = 0; i < colors.length; i++)
                GestureDetector(
                  onTap: () => currentColor.value = i,
                  child: Padding(
                    padding: EdgeInsets.only(left: Responsive().setWidth(10)),
                    child: Container(
                      width: Responsive().setWidth(30),
                      height: Responsive().setHeight(30),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: currentColor.value == i
                            ? <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black.withOpacity(.8),
                                  blurRadius: 10,
                                  offset: const Offset(0, 10),
                                ),
                              ]
                            : <BoxShadow>[],
                      ),
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: colors[i],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
