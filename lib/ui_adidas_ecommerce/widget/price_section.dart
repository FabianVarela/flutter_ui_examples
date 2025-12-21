part of '../adidas_ui.dart';

class _PriceSection extends StatelessWidget {
  const _PriceSection({required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: <Widget>[
        Padding(
          padding: const .only(left: 20),
          child: Text(
            'Price',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF949598),
              fontWeight: .w900,
            ),
          ),
        ),
        Stack(
          clipBehavior: .none,
          alignment: .topCenter,
          children: <Widget>[
            Padding(
              padding: const .only(left: 22),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: <Widget>[
                  Padding(
                    padding: const .only(left: 18, bottom: 10),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: .w500,
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
                        borderRadius: .circular(10),
                      ),
                      padding: const .symmetric(vertical: 14, horizontal: 35),
                    ),
                    onPressed: () {},
                    child: Align(
                      alignment: .centerLeft,
                      child: Text(
                        'Add to cart',
                        textAlign: .left,
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
              bottom: -60,
              child: SizedBox.fromSize(
                size: const Size(190, 155),
                child: Assets.images.adidas.cart.image(fit: .cover),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
