part of '../streaming_ui.dart';

class _StreamingList extends StatelessWidget {
  const _StreamingList({required this.streamingList, this.onSelectStream});

  final List<StreamingModel> streamingList;
  final ValueSetter<StreamingModel>? onSelectStream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Padding(
        padding: const EdgeInsets.only(left: 65),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Watch more',
                    style: GoogleFonts.mulish(fontSize: 22),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFE52020),
                    ),
                    child: const Text('View more'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.separated(
                itemCount: streamingList.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(12, 25, 0, 25),
                separatorBuilder: (_, __) => const Gap(24),
                itemBuilder: (_, index) => InkWell(
                  onTap: () => onSelectStream?.call(streamingList[index]),
                  child: Card(
                    elevation: 10,
                    surfaceTintColor: Colors.white,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox.fromSize(
                      size: const Size(220, 135),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            streamingList[index].image,
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              streamingList[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.mulish(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
