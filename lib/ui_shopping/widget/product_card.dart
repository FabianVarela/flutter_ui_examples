part of '../shopping_ui.dart';

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.shopping});

  final ShoppingModel shopping;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 330,
      decoration: BoxDecoration(
        color: shopping.color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(.3), width: .2),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          Image.asset(shopping.image, width: 201, height: 191),
          Text(
            shopping.title,
            style: GoogleFonts.ubuntu(fontSize: 25),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Assets.images.shopping.favorite.svg(),
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
                    const SizedBox(height: 12),
                    Text(
                      shopping.discountPrice,
                      style: GoogleFonts.varelaRound(fontSize: 28),
                    ),
                  ],
                ),
                IconButton(
                  icon: Assets.images.shopping.cart.svg(),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
