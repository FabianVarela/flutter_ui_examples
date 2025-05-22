part of '../story_ui.dart';

class _CustomTag extends StatelessWidget {
  const _CustomTag({
    required this.title,
    required this.message,
    required this.tagColor,
  });

  final String title;
  final String message;
  final Color tagColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        spacing: 15,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size.zero,
              backgroundColor: tagColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
            ),
            child: Text(title, style: GoogleFonts.ubuntu(color: Colors.white)),
          ),
          Text(message, style: GoogleFonts.ubuntu(color: Colors.blueAccent)),
        ],
      ),
    );
  }
}
