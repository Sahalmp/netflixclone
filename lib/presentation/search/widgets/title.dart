import 'package:flutter/material.dart';

class SearchTitle extends StatelessWidget {
  final searchtitle;
  const SearchTitle({Key? key, required this.searchtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      searchtitle,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
