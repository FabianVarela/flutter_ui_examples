import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/common/gen/fonts.gen.dart';
import 'package:vector_graphics/vector_graphics.dart';

class IceCreamButton extends StatelessWidget {
  const IceCreamButton({required this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: .end,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        disabledForegroundColor: Colors.white60,
        backgroundColor: const Color(0xFFF11359),
        disabledBackgroundColor: const Color(0xFFF11359).withValues(alpha: .6),
        shape: RoundedRectangleBorder(borderRadius: .circular(12)),
        minimumSize: const .fromHeight(60),
      ),
      onPressed: onPressed,
      icon: VectorGraphic(
        loader: AssetBytesLoader(Assets.svg.iceCream.arrowLeft),
        width: 30,
        colorFilter: .mode(
          onPressed != null ? Colors.white : Colors.white60,
          .srcIn,
        ),
      ),
      label: const Row(
        children: <Widget>[
          Text(
            'Place Order',
            style: TextStyle(
              fontSize: 20,
              fontFamily: FontFamily.museoSansCyrl,
              fontWeight: .w600,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
