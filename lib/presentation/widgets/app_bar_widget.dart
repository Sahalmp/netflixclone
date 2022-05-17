import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.cast, color: Colors.white)),
        kwidth,
        Container(
          height: 24,
          width: 24,
          color: Colors.blue,
          child: Image.asset(
            "asset/images/profileavatar.jpg",
            fit: BoxFit.cover,
          ),
        ),
        kwidth,
      ],
      
    );
  }
}
