part of '../adidas_ui.dart';

class _PriceSection extends StatelessWidget {
  const _PriceSection({required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Price',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF949598),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox.fromSize(
          size: const Size(double.infinity, 180),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 18, bottom: 10),
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: r'$ ',
                              style: TextStyle(fontSize: 26),
                            ),
                            TextSpan(
                              text: '$price',
                              style: const TextStyle(fontSize: 35),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFB382F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 35,
                        ),
                      ),
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Add to cart',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -40,
                bottom: 0,
                child: Assets.images.adidas.cart.image(
                  width: 190,
                  height: 155,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
