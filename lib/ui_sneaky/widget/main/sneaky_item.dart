part of '../../sneaky_ui.dart';

class _SneakyItem extends StatelessWidget {
  const _SneakyItem({required this.sneaky, required this.uuid});

  final Sneaky sneaky;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: uuid,
              child: Image.asset(sneaky.image, width: 200, height: 150),
            ),
            const Gap(35),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '\$ ${sneaky.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontFamily: FontFamily.avenirLTStd,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(2),
                      Text(
                        sneaky.name,
                        style: const TextStyle(
                          fontFamily: FontFamily.avenirLTStd,
                          fontSize: 16,
                        ),
                      ),
                      const Gap(20),
                      SizedBox(
                        height: 10,
                        child: ListView.separated(
                          itemCount: sneaky.colors.length,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, _) => const Gap(8),
                          itemBuilder: (_, index) => SizedBox.fromSize(
                            size: const Size(10, 10),
                            child: Container(color: sneaky.colors[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size(40, 40),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2),
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
