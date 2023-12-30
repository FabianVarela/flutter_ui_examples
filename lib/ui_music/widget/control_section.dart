part of '../music_ui.dart';

class ControlSection extends StatelessWidget {
  const ControlSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 110,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 290,
              height: 65,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF4B9AD5), width: 3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.fast_rewind, size: 55, color: Color(0xFF4B9AD5)),
                  Icon(Icons.fast_forward, size: 55, color: Color(0xFF4B9AD5)),
                ],
              ),
            ),
          ),
          Align(
            child: Container(
              width: 92,
              height: 92,
              decoration: const BoxDecoration(
                color: Color(0xFF4B9AD5),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  size: 45,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
