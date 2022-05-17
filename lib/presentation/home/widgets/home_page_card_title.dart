import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import 'home_page_card.dart';
import 'title.dart';

class HomeCardTitle extends StatelessWidget {
  final title;
  const HomeCardTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomePageTitle(title: title),
        Kheight,
        HomePageCard(),
      ],
    );
  }
}
