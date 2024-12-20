part of '../adidas_ui.dart';

class _ColorListSection extends HookWidget {
  const _ColorListSection({required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final currentColor = useState<int?>(null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 10),
          child: Text(
            'Select Color',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF949598),
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 34,
          margin: const EdgeInsets.only(left: 30, bottom: 20),
          child: Row(
            children: <Widget>[
              for (final (index, color) in colors.indexed) ...[
                InkWell(
                  onTap: () => currentColor.value = index,
                  child: SizedBox.fromSize(
                    size: const Size(30, 30),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          if (currentColor.value == index)
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .8),
                              blurRadius: 10,
                              offset: const Offset(0, 10),
                            ),
                        ],
                      ),
                      child: ClipPath(
                        clipper: AdidasClipper(),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                ),
                if (index <= colors.length - 1) const Gap(10),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
