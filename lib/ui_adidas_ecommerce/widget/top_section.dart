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
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Assets.images.adidas.a360.image(),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Rating',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF949598),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.star, color: Color(0xFFFFE600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        '${rating.value}',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFFFFE600),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        '(${rating.voted} people)',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
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
