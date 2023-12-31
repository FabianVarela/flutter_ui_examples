part of '../adidas_ui.dart';

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
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Size',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF949598),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 38,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (var i = 0; i < sizes.length; i++)
                GestureDetector(
                  onTap: () => currentSize.value = i,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Container(
                      width: 40,
                      height: 40,
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
