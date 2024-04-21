part of '../../sneaky_detail_ui.dart';

class _SneakySizeList extends HookWidget {
  const _SneakySizeList({required this.sizes});

  final List<SneakySize> sizes;

  @override
  Widget build(BuildContext context) {
    final current = useState<int?>(null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Size'.toUpperCase(),
          style: const TextStyle(
            fontFamily: 'AvenirLTStd',
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            itemCount: sizes.length,
            scrollDirection: Axis.horizontal,
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
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 10),
        decoration: size.isAvailable
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected ? Colors.black : Colors.grey,
                  width: isSelected ? 2 : 1,
                ),
              )
            : BoxDecoration(
                color: Colors.grey.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
        child: Text(
          '${size.size}',
          style: const TextStyle(
            fontFamily: 'AvenirLTStd',
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
