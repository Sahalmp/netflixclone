import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import 'home_page_card.dart';
import 'title.dart';

class HomeCardTitle extends StatelessWidget {
  const HomeCardTitle({
    required this.posterList,
    required this.title,
    Key? key,
  }) : super(key: key);
  final List<String> posterList;
  final title;
  @override
  Widget build(BuildContext context) {
    posterList.shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomePageTitle(title: title),
        Kheight,
        HomePageCard(
          posterList: posterList,
        ),
      ],
    );
  }
}
