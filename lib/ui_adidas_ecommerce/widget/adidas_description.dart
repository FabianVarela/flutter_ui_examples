import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class AdidasDescription extends HookWidget {
  const AdidasDescription({required this.description, super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: Responsive().setWidth(18),
            bottom: Responsive().setHeight(8),
          ),
          child: Text(
            'Product Description',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF949598),
              fontSize: Responsive().setSp(14),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Responsive().setWidth(26),
            right: Responsive().setWidth(18),
          ),
          child: AnimatedCrossFade(
            firstChild: Text(
              description,
              maxLines: 2,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: Responsive().setSp(14),
                fontWeight: FontWeight.w500,
              ),
            ),
            secondChild: Text(
              description,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: Responsive().setSp(14),
                fontWeight: FontWeight.w500,
              ),
            ),
            crossFadeState: isExpanded.value
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: kThemeAnimationDuration,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Responsive().setWidth(26),
            right: Responsive().setWidth(18),
            bottom: Responsive().setHeight(12),
          ),
          child: GestureDetector(
            child: Text(
              isExpanded.value ? 'less' : 'more...',
              style: GoogleFonts.montserrat(
                color: const Color(0xFFFB382F),
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () => isExpanded.value = !isExpanded.value,
          ),
        )
      ],
    );
  }
}
