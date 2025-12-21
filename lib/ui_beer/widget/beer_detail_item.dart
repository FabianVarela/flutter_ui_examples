part of '../beer_ui.dart';

class BeerDetailItem extends StatelessWidget {
  const BeerDetailItem({required this.beer, super.key});

  final BeerModel beer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: <Widget>[
        Text(
          beer.name,
          textAlign: .center,
          style: GoogleFonts.montserrat(fontSize: 30, fontWeight: .w700),
        ),
        const Gap(5),
        Text(beer.slogan, style: GoogleFonts.montserrat(fontSize: 14)),
        const Gap(10),
        RatingBarIndicator(
          itemSize: 22,
          rating: beer.rating,
          itemBuilder: (_, _) => const Icon(Icons.star, color: Colors.yellow),
        ),
        const Gap(5),
        Padding(
          padding: const .fromLTRB(30, 8, 30, 8),
          child: Text(
            beer.description,
            textAlign: .center,
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: .w300),
          ),
        ),
      ],
    );
  }
}
