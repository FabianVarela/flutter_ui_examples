part of '../streaming_ui.dart';

class StreamingList extends StatelessWidget {
  const StreamingList({required this.streamingList, super.key});

  final List<StreamingModel> streamingList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      margin: const EdgeInsets.only(left: 65),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Watch now',
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
            child: ListView.builder(
              itemCount: streamingList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 12,
                ),
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
    );
  }
}
