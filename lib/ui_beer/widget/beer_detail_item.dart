part of '../beer_ui.dart';

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
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            beer.slogan,
            style: GoogleFonts.montserrat(fontSize: 14),
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
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
