part of '../streaming_ui.dart';

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: StreamingClipper(),
            child: Container(
              height: 370,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 100, left: 90),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[Color(0x00000000), Color(0xD9333333)],
                        stops: <double>[0, 0.9],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomLeft,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'WATCH BEFORE EVERYONE',
                          style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          title,
                          style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 360,
            right: -30,
            child: FractionalTranslation(
              translation: const Offset(0, -.5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.add, color: Color(0xFFE52020)),
                    onPressed: () {},
                  ),
                  const Gap(12),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE52020),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 80,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      label: Text(
                        'Watch now',
                        style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
