import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';

// import '../../../core/constants.dart';
import 'package:bordered_text/bordered_text.dart';

// const _imageUrl =
//     "https://www.themoviedb.org/t/p/original/u9fvqenMMyeyWjIWFRxjnfJvD1N.jpg";

class HomeNumberCard extends StatelessWidget {
  const HomeNumberCard({
    required this.posterpath,
    Key? key,
  }) : super(key: key);
  final List<String> posterpath;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LimitedBox(
      maxHeight: size.width * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Container(
                    width: size.width * 0.27,
                    height: size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image:  DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(posterpath[index]))),
                  ),
                ),
                Positioned(
                  top: 60,
                  child: BorderedText(
                    strokeColor: color_white,
                    strokeWidth: 5.0,
                    child: Text(
                      '${index + 1}',
                      style:
                          const TextStyle(fontSize: 120, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
