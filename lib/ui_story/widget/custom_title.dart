part of '../story_ui.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({required this.title, super.key});

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
            icon: const Icon(CustomIcons.option, color: Colors.white, size: 12),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
