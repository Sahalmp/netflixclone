import 'package:flutter/material.dart';

import '../../../core/constants.dart';

const _imageUrl =
    "https://www.themoviedb.org/t/p/original/u9fvqenMMyeyWjIWFRxjnfJvD1N.jpg";

class HomePageCard extends StatelessWidget {
  const HomePageCard({
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
        itemCount: 10,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              width: size.width * 0.27,
              height: size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(_imageUrl))),
            ),
          ],
        ),
      ),
    );
  }
}
