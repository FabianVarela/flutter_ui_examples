part of '../furniture_ui.dart';

class _FurnitureItem extends StatelessWidget {
  const _FurnitureItem({
    required this.image,
    required this.title,
    required this.price,
    this.currentIndex = 0,
  });

  final String image;
  final String title;
  final String price;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, bottom: 50),
      child: SizedBox(
        width: 200,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: currentIndex.isEven
                      ? Colors.white
                      : const Color(0xFF2A2D3F),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 10),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(image, width: 172, height: 199),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: currentIndex.isEven
                              ? const Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'New Sell',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: currentIndex.isEven
                              ? const Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 45),
                      Text(
                        '$price \$',
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: currentIndex.isEven
                              ? const Color(0xFF2A2D3F)
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
