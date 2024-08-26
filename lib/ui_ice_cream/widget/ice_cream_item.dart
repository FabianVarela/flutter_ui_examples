import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui_examples/ui_ice_cream/model/ice_cream_model.dart';
import 'package:gap/gap.dart';

class IceCreamItem extends StatelessWidget {
  const IceCreamItem({required this.iceCream, super.key});

  final IceCreamModel iceCream;

  @override
  Widget build(BuildContext context) {
    final foreground = iceCream.foreground;

    return SizedBox(
      height: 120,
      child: InkWell(
        onTap: () {},
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Card(
              elevation: 8,
              color: iceCream.background,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      iceCream.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: foreground,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(4),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '\$ ${iceCream.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Gap(6),
                        Expanded(
                          flex: 2,
                          child: RatingBar(
                            itemSize: 14,
                            allowHalfRating: true,
                            initialRating: iceCream.rate,
                            ratingWidget: RatingWidget(
                              full: Icon(Icons.star, color: foreground),
                              half: Icon(Icons.star_half, color: foreground),
                              empty: Icon(Icons.star_border, color: foreground),
                            ),
                            onRatingUpdate: (_) {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: -5,
              child: SizedBox.fromSize(
                size: const Size(140, 140),
                child: Image.asset(iceCream.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
