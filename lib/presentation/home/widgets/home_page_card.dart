import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/constants.dart';


class HomePageCard extends StatelessWidget {
  final List<String> posterList;
  HomePageCard({
    required this.posterList,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LimitedBox(
      maxHeight: size.width * 0.4,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => kwidth,
        itemCount: posterList.length,
        itemBuilder: (context, index) => Column(
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
          ],
        ),
      ),
    );
  }
}
