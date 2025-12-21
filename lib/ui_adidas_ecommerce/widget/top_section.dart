part of '../adidas_ui.dart';

class _TopSection extends StatelessWidget {
  const _TopSection({required this.image, required this.rating});

  final String image;
  final AdidasRating rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(300),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox.fromSize(
                size: .infinite,
                child: Image.asset(image, fit: .cover),
              ),
              Padding(
                padding: const .only(top: 60, right: 35),
                child: Align(
                  alignment: .topRight,
                  child: SizedBox.square(
                    dimension: 50,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        shape: .circle,
                      ),
                      child: Assets.images.adidas.a360.image(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 18,
            bottom: 15,
            child: Column(
              crossAxisAlignment: .start,
              children: <Widget>[
                Text(
                  'Rating',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF949598),
                    fontSize: 14,
                    fontWeight: .w500,
                  ),
                ),
                const Gap(8),
                Row(
                  children: <Widget>[
                    const Padding(
                      padding: .symmetric(horizontal: 8),
                      child: Icon(Icons.star, color: Color(0xFFFFE600)),
                    ),
                    Text(
                      '${rating.value}',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFFFFE600),
                        fontSize: 16,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      '(${rating.voted} people)',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const Gap(8),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
