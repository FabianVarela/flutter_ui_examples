// ignore_for_file: unused_element

part of '../story_ui.dart';

double _cardAspectRatio = 12.0 / 16.0;

class _CardScroll extends StatelessWidget {
  const _CardScroll({
    required this.stories,
    required this.currentPage,
    this.padding = 20,
    this.verticalInset = 20,
  });

  final List<StoryModel> stories;
  final double currentPage;
  final double padding;
  final double verticalInset;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _cardAspectRatio * 1.2,
      child: LayoutBuilder(
        builder: (_, constraint) {
          final width = constraint.maxWidth;
          final height = constraint.maxHeight;

          final safeWidth = width - 2 * padding;
          final safeHeight = height - 2 * padding;

          final heightOfPrimaryCard = safeHeight;
          final widthOfPrimaryCard = heightOfPrimaryCard * _cardAspectRatio;

          final primaryCardLeft = safeWidth - widthOfPrimaryCard;
          final horizontalInset = primaryCardLeft / 2;

          return Stack(
            children: stories.mapIndexed((index, item) {
              final delta = index - currentPage;
              final totalDelta = -delta * (delta > 0 ? 15 : 1);

              final primary = primaryCardLeft - horizontalInset * totalDelta;
              final start = padding + max(primary, 0);

              return Positioned.directional(
                start: start,
                textDirection: TextDirection.rtl,
                top: padding + verticalInset * max(-delta, 0.0),
                bottom: padding + verticalInset * max(-delta, 0.0),
                child: _CardItem(image: item.image, name: item.name),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3, 6),
              blurRadius: 10,
            ),
          ],
        ),
        child: AspectRatio(
          aspectRatio: _cardAspectRatio,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(image, fit: BoxFit.cover),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        name,
                        style: GoogleFonts.varelaRound(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 12),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 6,
                          ),
                        ),
                        child: Text(
                          'Read later',
                          style: GoogleFonts.varelaRound(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
