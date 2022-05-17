import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/widgets/title.dart';

const _imageUrl =
    "https://www.themoviedb.org/t/p/original/u9fvqenMMyeyWjIWFRxjnfJvD1N.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Kheight,
          const SearchTitle(searchtitle: 'Movies & TV'),
          Kheight,
          GridView.count(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            childAspectRatio: 1.05 / 1.4,
            children: List.generate(20, (index) {
              return const MainCard();
            }),
          ),
          Kheight20,
          ListView(
            shrinkWrap: true,
            children: [
              const Text(
                'Explore titles related to',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Kheight20,
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Text(
                      'Hey Sinamika $index',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Kheight20;
                  },
                  itemCount: 10)
            ],
          )
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: const DecorationImage(
              image: NetworkImage(_imageUrl), fit: BoxFit.cover)),
    );
  }
}
