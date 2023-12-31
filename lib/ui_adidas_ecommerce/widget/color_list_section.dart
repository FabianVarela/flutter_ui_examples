part of '../adidas_ui.dart';

class ColorListSection extends HookWidget {
  const ColorListSection({required this.colors, super.key});

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
          margin: const EdgeInsets.only(left: 20, bottom: 20),
          child: Row(
            children: <Widget>[
              for (var i = 0; i < colors.length; i++)
                GestureDetector(
                  onTap: () => currentColor.value = i,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          if (currentColor.value == i)
                            BoxShadow(
                              color: Colors.black.withOpacity(.8),
                              blurRadius: 10,
                              offset: const Offset(0, 10),
                            ),
                        ],
                      ),
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: colors[i],
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
