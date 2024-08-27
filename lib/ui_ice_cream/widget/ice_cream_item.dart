import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui_examples/ui_ice_cream/model/ice_cream_model.dart';
import 'package:gap/gap.dart';

class IceCreamItem extends StatelessWidget {
  const IceCreamItem({required this.iceCream, this.onPress, super.key});

  final IceCreamModel iceCream;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final foreground = iceCream.foreground;

    return SizedBox(
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          InkWell(
            onTap: onPress,
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.only(right: 10),
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
          ),
          Positioned(
            right: -10,
            child: SizedBox.fromSize(
              size: const Size(130, 130),
              child: Hero(
                tag: '${iceCream.name}_${iceCream.rate}',
                child: Image.asset(iceCream.image, fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
