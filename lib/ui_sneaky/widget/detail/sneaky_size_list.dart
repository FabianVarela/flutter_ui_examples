part of '../../sneaky_detail_ui.dart';

class _SneakySizeList extends HookWidget {
  const _SneakySizeList({required this.sizes});

  final List<SneakySize> sizes;

  @override
  Widget build(BuildContext context) {
    final current = useState<int?>(null);

    return Column(
      crossAxisAlignment: .stretch,
      children: <Widget>[
        Text(
          'Size'.toUpperCase(),
          style: const TextStyle(
            fontFamily: FontFamily.avenirLTStd,
            fontSize: 16,
            fontWeight: .w900,
          ),
        ),
        Container(
          height: 50,
          margin: const .only(top: 15),
          child: ListView.builder(
            itemCount: sizes.length,
            scrollDirection: .horizontal,
            itemBuilder: (_, index) => _SizeItem(
              size: sizes[index],
              isSelected: current.value != null && current.value == index,
              onTap: () => current.value = index,
            ),
          ),
        ),
      ],
    );
  }
}

class _SizeItem extends StatelessWidget {
  const _SizeItem({required this.size, this.isSelected = false, this.onTap});

  final SneakySize size;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: size.isAvailable ? onTap : null,
      child: Container(
        width: 50,
        alignment: .center,
        margin: const .only(right: 10),
        decoration: size.isAvailable
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(10),
                border: .all(
                  color: isSelected ? Colors.black : Colors.grey,
                  width: isSelected ? 2 : 1,
                ),
              )
            : BoxDecoration(
                color: Colors.grey.withValues(alpha: .3),
                borderRadius: .circular(10),
              ),
        child: Text(
          '${size.size}',
          style: const TextStyle(
            fontFamily: FontFamily.avenirLTStd,
            fontSize: 15,
            fontWeight: .w700,
          ),
        ),
      ),
    );
  }
}
