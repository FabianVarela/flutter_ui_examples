import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_story/story_model.dart';
import 'package:google_fonts/google_fonts.dart';

double _cardAspectRatio = 12.0 / 16.0;
double _widgetAspectRatio = _cardAspectRatio * 1.2;

class CardScroll extends StatelessWidget {
  const CardScroll(
    this.currentPage, {
    this.padding = 20,
    this.verticalInset = 20,
    super.key,
  });

  final double currentPage;
  final double padding;
  final double verticalInset;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _widgetAspectRatio,
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
            children: List<Widget>.generate(stories.length, (index) {
              final delta = index - currentPage;
              final a = primaryCardLeft -
                  horizontalInset * -delta * (delta > 0 ? 15 : 1);
              final start = padding + max(a, 0);

              return Positioned.directional(
                top: padding + verticalInset * max(-delta, 0.0),
                bottom: padding + verticalInset * max(-delta, 0.0),
                start: start,
                textDirection: TextDirection.rtl,
                child: _setItem(index),
              );
            }),
          );
        },
      ),
    );
  }

  Widget _setItem(int index) {
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
              Image.asset(stories[index].image, fit: BoxFit.cover),
              _setDescription(index),
            ],
          ),
        ),
      ),
    );
  }

  Widget _setDescription(int index) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive().setWidth(16),
              vertical: Responsive().setHeight(8),
            ),
            child: Text(
              stories[index].name,
              style: GoogleFonts.varelaRound(
                color: Colors.white,
                fontSize: Responsive().setSp(25),
              ),
            ),
          ),
          SizedBox(height: Responsive().setHeight(10)),
          Padding(
            padding: EdgeInsets.only(
              left: Responsive().setWidth(12),
              bottom: Responsive().setHeight(12),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive().setWidth(22),
                vertical: Responsive().setHeight(6),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Read later',
                style: GoogleFonts.varelaRound(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
