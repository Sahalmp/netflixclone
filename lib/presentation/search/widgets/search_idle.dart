import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/widgets/title.dart';

import '../../../application/Search/search_bloc.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Kheight,
        const SearchTitle(searchtitle: 'Top Searches'),
        Kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error while getting data'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('List is empty'),
                );
              }

              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                      imageUrl: '$imageAppendUrl${movie.backdropPath}',
                      title: movie.title ??
                          movie.originalname ??
                          movie.name ??
                          movie.originaltitle ??
                          "No title Provided",
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Kheight;
                  },
                  itemCount: 15);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
            width: screenWidth * 0.32,
            height: screenWidth * 0.18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageUrl)))),
        kwidth,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: color_white, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(
            CupertinoIcons.play_circle,
            color: color_white,
            size: 45,
          ),
        )
      ],
    );
  }
}
