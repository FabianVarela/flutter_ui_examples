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

    _animation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    super.initState();
  }

  @override
  void didUpdateWidget(covariant BeerHeader oldWidget) {
    if (oldWidget.index != widget.index) {
      _controller.forward();

      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() => _imageIndex = widget.index);
        _controller.reverse();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 130, left: 40, right: 20),
          child: AnimatedDefaultTextStyle(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 1),
            style: GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: beers[widget.index].textColor,
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
    );
  }
}
