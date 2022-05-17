import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../screen_home.dart';

const _imageUrl =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/iwnQ1JH1wdWrGYkgWySptJ5284A.jpg";

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(_imageUrl), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(icon: Icons.add, label: 'My List'),
              PlayButton(),
              const CustomButtonWidget(icon: Icons.info_outline, label: 'Info')
            ],
          ),
        ),
      ],
    );
  }

  ElevatedButton PlayButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: Colors.black,
      ),
      label: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Play',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(color_white)),
    );
  }
}
