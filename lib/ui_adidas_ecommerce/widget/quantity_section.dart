part of '../adidas_ui.dart';

class _QuantitySection extends HookWidget {
  const _QuantitySection();

  @override
  Widget build(BuildContext context) {
    final amount = useState(0);

    return Column(
      spacing: 12,
      crossAxisAlignment: .start,
      children: <Widget>[
        Text(
          'Quantity',
          style: GoogleFonts.montserrat(
            color: const Color(0xFF949598),
            fontSize: 14,
            fontWeight: .w500,
          ),
        ),
        Container(
          height: 40,
          margin: const .only(left: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF525663),
            borderRadius: .circular(5),
          ),
          child: Row(
            mainAxisSize: .min,
            mainAxisAlignment: .spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: IconButton(
                  onPressed: amount.value > 0 ? () => amount.value-- : null,
                  icon: const Icon(Icons.remove, size: 24, color: Colors.white),
                ),
              ),
              const Padding(
                padding: .symmetric(vertical: 8),
                child: VerticalDivider(color: Colors.black, width: 2),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const .symmetric(horizontal: 12),
                  child: FittedBox(
                    child: Text(
                      '${amount.value}',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: .w900,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: .symmetric(vertical: 8),
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
