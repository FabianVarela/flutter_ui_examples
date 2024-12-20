part of '../adidas_ui.dart';

class _SizeSection extends HookWidget {
  const _SizeSection({required this.sizes});

  final List<int> sizes;

  @override
  Widget build(BuildContext context) {
    final currentSize = useState<int?>(null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Size',
          style: GoogleFonts.montserrat(
            color: const Color(0xFF949598),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(8),
        SizedBox(
          height: 38,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Gap(12),
              for (final (index, size) in sizes.indexed) ...[
                InkWell(
                  onTap: () => currentSize.value = index,
                  child: SizedBox.fromSize(
                    size: const Size(40, 40),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: index == currentSize.value
                            ? const Color(0xFFFC3930)
                            : const Color(0xFF525663),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: index == currentSize.value
                                ? Colors.black.withValues(alpha: .5)
                                : Colors.black12,
                            offset: const Offset(0, 10),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '$size',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (index <= sizes.length - 1) const Gap(10),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
