import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:flutter_ui_examples/ui_streaming/model/streaming_model.dart';
import 'package:google_fonts/google_fonts.dart';

class StreamingList extends StatelessWidget {
  const StreamingList({required this.streamingList, super.key});

  final List<StreamingModel> streamingList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive().setHeight(320),
      margin: EdgeInsets.only(left: Responsive().setWidth(65)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive().setWidth(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Watch now',
                  style: GoogleFonts.mulish(fontSize: Responsive().setSp(22)),
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
            height: Responsive().setHeight(250),
            child: ListView.builder(
              itemCount: streamingList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Responsive().setHeight(25),
                  horizontal: Responsive().setWidth(12),
                ),
                child: Card(
                  elevation: 10,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: Responsive().setHeight(220),
                    width: Responsive().setWidth(135),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          streamingList[index].image,
                          width: double.infinity,
                          height: Responsive().setHeight(150),
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            streamingList[index].title,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.mulish(
                              fontSize: Responsive().setSp(16),
                            ),
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
