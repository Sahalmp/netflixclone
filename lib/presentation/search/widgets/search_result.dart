import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/widgets/title.dart';

import '../../../application/Search/search_bloc.dart';

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
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 3,
                childAspectRatio: 1.05 / 1.4,
                children: List.generate(
                    state.searchResultList.length.clamp(0, 18), (index) {
                  final movie = state.searchResultList[index];
                  return MainCard(
                    imageUrl: '$imageAppendUrl${movie.posterPath}',
                  );
                }),
              );
            },
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
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final movie = state.searchResultList[index];

                        return Text(
                          '${movie.originalTitle}',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Kheight20;
                      },
                      itemCount: 10);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}
