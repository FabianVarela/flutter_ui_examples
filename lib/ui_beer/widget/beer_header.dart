part of '../beer_ui.dart';

class BeerHeader extends StatefulWidget {
  const BeerHeader({required this.index, super.key});

  final int index;

  @override
  State<BeerHeader> createState() => _BeerHeaderState();
}

class _BeerHeaderState extends State<BeerHeader> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  late int _imageIndex = widget.index;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    super.initState();
  }

  @override
  void didUpdateWidget(covariant BeerHeader oldWidget) {
    if (oldWidget.index != widget.index) {
      unawaited(_controller.forward());

      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() => _imageIndex = widget.index);
        unawaited(_controller.reverse());
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return ClipPath(
      clipper: MyClipper(),
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 1),
        width: width,
        height: height * .53,
        decoration: BoxDecoration(
          color: beers[_imageIndex].color,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 130, left: 40, right: 20),
              child: AnimatedDefaultTextStyle(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 1),
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: beers[_imageIndex].textColor,
                ),
                child: const Text('Grab\nyour\nbeer.'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionalTranslation(
                translation: const Offset(0, .25),
                child: SlideTransition(
                  position: _animation,
                  child: Opacity(
                    opacity: .15,
                    child: Image.asset(beers[_imageIndex].backImage),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
