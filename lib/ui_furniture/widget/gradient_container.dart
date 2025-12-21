part of '../furniture_ui.dart';

class _GradientContainer extends StatelessWidget {
  const _GradientContainer();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .topRight,
      child: Container(
        width: MediaQuery.sizeOf(context).width * .8,
        height: MediaQuery.sizeOf(context).height / 2,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Color(0xFFFBFCFD), Color(0xFFF2F3F8)],
            begin: .topCenter,
            end: .bottomCenter,
          ),
        ),
      ),
    );
  }
}
