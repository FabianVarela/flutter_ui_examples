part of '../../sneaky_detail_ui.dart';

class _CustomButton extends StatelessWidget {
  const _CustomButton({required this.text, required this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: const .symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: .circular(10)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: FontFamily.avenirLTStd,
          fontWeight: .w700,
        ),
      ),
    );
  }
}
