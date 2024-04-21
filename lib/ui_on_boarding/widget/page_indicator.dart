part of '../on_boarding_ui.dart';

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.pageCount, this.currentPage = 0});

  final int pageCount;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(pageCount, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: index == currentPage
                    ? Colors.white
                    : const Color(0xFF3E4750),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
