part of '../adidas_ui.dart';

class _TopSection extends StatelessWidget {
  const _TopSection({required this.image, required this.rating});

  final String image;
  final AdidasRating rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(double.infinity, 300),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 35),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox.fromSize(
                    size: const Size(50, 50),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rating',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF949598),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(8),
                Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
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
