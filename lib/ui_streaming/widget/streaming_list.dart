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
        padding: const .only(left: 65),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const .symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: <Widget>[
                  Text('Watch more', style: GoogleFonts.mulish(fontSize: 22)),
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
                scrollDirection: .horizontal,
                padding: const .fromLTRB(12, 25, 0, 25),
                separatorBuilder: (_, _) => const Gap(24),
                itemBuilder: (_, index) => InkWell(
                  onTap: () => onSelectStream?.call(streamingList[index]),
                  child: Card(
                    elevation: 10,
                    surfaceTintColor: Colors.white,
                    clipBehavior: .antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                    child: SizedBox.fromSize(
                      size: const Size(220, 135),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: <Widget>[
                          SizedBox.fromSize(
                            size: const Size.fromHeight(150),
                            child: Image.asset(
                              streamingList[index].image,
                              fit: .cover,
                            ),
                          ),
                          Padding(
                            padding: const .all(8),
                            child: Text(
                              streamingList[index].title,
                              overflow: .ellipsis,
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
