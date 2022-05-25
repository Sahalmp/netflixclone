import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';

import '../../../core/constants.dart';

class RecentlyPlayedCard extends StatelessWidget {
  final List<String> posterList;
  RecentlyPlayedCard({
    required this.posterList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LimitedBox(
      maxHeight: size.width * 0.5,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => kwidth,
        itemCount: posterList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                child: Container(
                  width: size.width * 0.27,
                  height: size.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(posterList[index]))),
                ),
              ),
              Container(
                  height: 35,
                  width: size.width * 0.27,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 30, 32, 33)),
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        value: 0.3,
                        minHeight: 1.5,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.info_outline,
                              color: color_white,
                            ),
                            Icon(
                              Icons.more_vert,
                              color: color_white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
