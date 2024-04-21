part of '../furniture_ui.dart';

class _CustomTitle extends StatelessWidget {
  const _CustomTitle({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
