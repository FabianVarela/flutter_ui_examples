part of '../adidas_ui.dart';

class _AdidasDescription extends HookWidget {
  const _AdidasDescription({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return Column(
      crossAxisAlignment: .start,
      children: <Widget>[
        Padding(
          padding: const .only(left: 18, bottom: 8),
          child: Text(
            'Product Description',
            style: GoogleFonts.montserrat(
              color: const Color(0xFF949598),
              fontSize: 14,
              fontWeight: .w600,
            ),
          ),
        ),
        Padding(
          padding: const .only(left: 26, right: 18),
          child: AnimatedCrossFade(
            firstChild: Text(
              description,
              maxLines: 2,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 14,
                fontWeight: .w500,
              ),
            ),
            secondChild: Text(
              description,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 14,
                fontWeight: .w500,
              ),
            ),
            crossFadeState: isExpanded.value ? .showSecond : .showFirst,
            duration: kThemeAnimationDuration,
          ),
        ),
        Padding(
          padding: const .only(left: 26, right: 18, bottom: 12),
          child: GestureDetector(
            child: Text(
              isExpanded.value ? 'less' : 'more...',
              style: GoogleFonts.montserrat(
                color: const Color(0xFFFB382F),
                fontWeight: .w700,
              ),
            ),
            onTap: () => isExpanded.value = !isExpanded.value,
          ),
        ),
      ],
    );
  }
}
