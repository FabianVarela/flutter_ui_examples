import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantitySection extends HookWidget {
  const QuantitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final amount = useState(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: Responsive().setHeight(12)),
          child: Text(
            'Quantity',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF949598),
              fontSize: Responsive().setSp(14),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: Responsive().setHeight(40),
          margin: EdgeInsets.only(left: Responsive().setWidth(12)),
          decoration: BoxDecoration(
            color: const Color(0xFF525663),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: IconButton(
                  onPressed: amount.value > 0 ? () => amount.value-- : null,
                  icon: const Icon(
                    Icons.remove,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: VerticalDivider(color: Colors.black, width: 2),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive().setWidth(12),
                  ),
                  child: Text(
                    '${amount.value}',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: Responsive().setSp(22),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: VerticalDivider(color: Colors.black, width: 2),
              ),
              Flexible(
                flex: 3,
                child: IconButton(
                  onPressed: amount.value < 50 ? () => amount.value++ : null,
                  icon: const Icon(Icons.add, size: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
