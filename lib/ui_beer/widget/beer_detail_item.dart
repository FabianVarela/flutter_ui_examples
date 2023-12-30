import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_beer/model/beer_model.dart';
import 'package:google_fonts/google_fonts.dart';

class BeerDetailItem extends StatelessWidget {
  const BeerDetailItem({required this.beer, super.key});

  final BeerModel beer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 5),
          child: Text(
            beer.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: Responsive().setSp(35),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            beer.slogan,
            style: GoogleFonts.montserrat(
              fontSize: Responsive().setSp(14),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: RatingBarIndicator(
            itemSize: 22,
            rating: beer.rating,
            itemBuilder: (_, __) => const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 8),
          child: Text(
            beer.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: Responsive().setSp(18),
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
