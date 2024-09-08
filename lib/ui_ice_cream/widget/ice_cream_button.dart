import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/gen/assets.gen.dart';
import 'package:flutter_ui_examples/common/gen/fonts.gen.dart';

class IceCreamButton extends StatelessWidget {
  const IceCreamButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: IconAlignment.end,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        disabledForegroundColor: Colors.white60,
        backgroundColor: const Color(0xFFF11359),
        disabledBackgroundColor: const Color(0xFFF11359).withOpacity(.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 60),
      ),
      onPressed: onPressed,
      icon: Assets.images.iceCream.arrowLeft.svg(
        width: 30,
        colorFilter: ColorFilter.mode(
          onPressed != null ? Colors.white : Colors.white60,
          BlendMode.srcIn,
        ),
      ),
      label: const Row(
        children: <Widget>[
          Text(
            'Place Order',
            style: TextStyle(
              fontSize: 20,
              fontFamily: FontFamily.museoSansCyrl,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
