import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class SizeSection extends HookWidget {
  const SizeSection({required this.sizes, super.key});

  final List<int> sizes;

  @override
  Widget build(BuildContext context) {
    final currentSize = useState<int?>(null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            bottom: Responsive().setHeight(8),
          ),
          child: Text(
            'Size',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF949598),
              fontSize: Responsive().setSp(14),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: Responsive().setHeight(38),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (var i = 0; i < sizes.length; i++)
                GestureDetector(
                  onTap: () => currentSize.value = i,
                  child: Padding(
                    padding: EdgeInsets.only(left: Responsive().setWidth(12)),
                    child: Container(
                      width: Responsive().setWidth(40),
                      height: Responsive().setHeight(40),
                      decoration: BoxDecoration(
                        color: i == currentSize.value
                            ? const Color(0xFFFC3930)
                            : const Color(0xFF525663),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: i == currentSize.value
                                ? Colors.black.withOpacity(.5)
                                : Colors.black12,
                            offset: const Offset(0, 10),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${sizes[i]}',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
