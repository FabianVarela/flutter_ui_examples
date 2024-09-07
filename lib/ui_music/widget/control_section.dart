part of '../music_ui.dart';

class _ControlSection extends StatelessWidget {
  const _ControlSection();

  @override
  Widget build(BuildContext context) {
    final controlIcons = <IconData>[Icons.fast_rewind, Icons.fast_forward];

    return SizedBox.fromSize(
      size: const Size(350, 110),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 290,
              height: 65,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF4B9AD5), width: 3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (final icon in controlIcons)
                      Icon(icon, size: 55, color: const Color(0xFF4B9AD5)),
                  ],
                ),
              ),
            ),
          ),
          Align(
            child: IconButton(
              style: IconButton.styleFrom(
                minimumSize: const Size(92, 92),
                shape: const CircleBorder(),
                backgroundColor: const Color(0xFF4B9AD5),
              ),
              icon: const Icon(
                Icons.play_arrow,
                size: 45,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
