part of '../story_ui.dart';

class _CustomTitle extends StatelessWidget {
  const _CustomTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: 46,
              letterSpacing: 1,
            ),
          ),
          IconButton(
            icon: VectorGraphic(
              loader: AssetBytesLoader(Assets.svg.story.options),
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
