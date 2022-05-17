import 'package:flutter/cupertino.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/widgets/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/hAv1GwwatyWV1RFXOfaASxgUVm4.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Kheight,
        SearchTitle(searchtitle: 'Top Searches'),
        Kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const TopSearchItemTile();
              },
              separatorBuilder: (context, index) {
                return Kheight;
              },
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
            width: screenWidth * 0.32,
            height: screenWidth * 0.18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageUrl)))),
        kwidth,
        const Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(
              color: color_white, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(
            CupertinoIcons.play_circle,
            color: color_white,
            size: 45,
          ),
        )
      ],
    );
  }
}
