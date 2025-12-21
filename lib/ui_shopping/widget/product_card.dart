part of '../shopping_ui.dart';

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.shopping});

  final ShoppingModel shopping;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const .fromHeight(330),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: shopping.color,
          borderRadius: .circular(20),
          border: .all(color: Colors.grey.withValues(alpha: .3), width: .2),
        ),
        child: Column(
          children: <Widget>[
            const Gap(8),
            Image.asset(shopping.image, width: 201, height: 191),
            Text(shopping.title, style: GoogleFonts.ubuntu(fontSize: 25)),
            const Gap(15),
            Padding(
              padding: const .symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: VectorGraphic(
                      loader: AssetBytesLoader(Assets.svg.shopping.favorite),
                    ),
                    onPressed: () {},
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        shopping.originalPrice,
                        style: GoogleFonts.varelaRound(
                          color: const Color(0xFFFEB0BA),
                          fontSize: 16,
                        ),
                      ),
                      const Gap(12),
                      Text(
                        shopping.discountPrice,
                        style: GoogleFonts.varelaRound(fontSize: 28),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: VectorGraphic(
                      loader: AssetBytesLoader(Assets.svg.shopping.cart),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
