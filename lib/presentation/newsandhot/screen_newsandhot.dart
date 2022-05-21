import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/home/screen_home.dart';

import '../../application/newandhot/bloc/hotandnew_bloc.dart';
import '../../core/constants.dart';

const _imageUrl =
    "https://www.themoviedb.org/t/p/original/u9fvqenMMyeyWjIWFRxjnfJvD1N.jpg";

class ScreenNewsAndHot extends StatelessWidget {
  const ScreenNewsAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hot & New",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.cast, color: Colors.white)),
            kwidth,
            SizedBox(
              child: Image.asset(
                "asset/images/profileavatar.jpg",
                width: 24,
                height: 24,
              ),
            ),
            kwidth,
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: color_white,
                    ),
                    labelColor: Colors.black,
                    isScrollable: true,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    unselectedLabelColor: color_white,
                    labelPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    tabs: const [
                      Tab(
                        text: "🍿 Coming Soon",
                      ),
                      Tab(
                        text: "🔥 Everyone's Watching",
                      ),
                    ]),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            BuildCommingSoon(
              key: Key('coming_soon'),
            ),
            BuildEveryOneWatching(
              key: Key('everyone_is_watching'),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildEveryOneWatching extends StatelessWidget {
  const BuildEveryOneWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context)
          .add(const LoadDataEveryoneisWatching());
    });
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView(
        children: [
          Kheight30,
          const Text(
            "🍿 Everyone's Watching",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<HotandnewBloc>(context)
                  .add(const LoadDataEveryoneisWatching());
            },
            child: BlocBuilder<HotandnewBloc, HotandnewState>(
                builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error Getting Data '),
                );
              } else if (state.everyoneiswatchinglist.isEmpty) {
                return const Center(
                  child: Text('Error Getting Data '),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: state.everyoneiswatchinglist.length,
                  itemBuilder: (context, index) {
                    final movie = state.everyoneiswatchinglist[index];
                    if (movie.originalName == null) {
                      return const SizedBox();
                    }

                    return EveryOneIsWatching(
                        backgroundpath: movie.backdropPath == null
                            ? imageAppendUrl + movie.posterPath.toString()
                            : imageAppendUrl + movie.backdropPath.toString(),
                        movieName: movie.originalName ?? 'No description',
                        description: movie.overview ?? 'No description');
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}

class EveryOneIsWatching extends StatelessWidget {
  final String backgroundpath;
  final String movieName;
  final String description;
  const EveryOneIsWatching(
      {Key? key,
      required this.backgroundpath,
      required this.movieName,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Kheight20,
        Row(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     image: DecorationImage(
                          //         image: NetworkImage(backgroundpath
                          //         ),
                          //         fit: BoxFit.cover)),
                          width: double.infinity,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              backgroundpath,
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext _, Widget child,
                                  ImageChunkEvent? progress) {
                                if (progress == null) {
                                  return child;
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  );
                                }
                              },
                              errorBuilder: (BuildContext _, Object a,
                                  StackTrace? trace) {
                                return Center(
                                  child: Icon(Icons.wifi),
                                );
                              },
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 10,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.volume_mute_outlined,
                              size: 22,
                              color: color_white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Kheight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              movieName,
                              maxLines: 1,
                              style: const TextStyle(
                                  letterSpacing: -2,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: const [
                            CustomButtonWidget(
                              icon: Icons.share_outlined,
                              label: "Share",
                              textsize: 12,
                            ),
                            kwidth,
                            kwidth,
                            CustomButtonWidget(
                              icon: Icons.add,
                              label: "My List",
                              textsize: 12,
                            ),
                            kwidth,
                            kwidth,
                            CustomButtonWidget(
                              icon: Icons.play_arrow,
                              label: "Play",
                              textsize: 12,
                            ),
                            kwidth,
                            kwidth,
                          ],
                        )
                      ],
                    ),
                    // Kheight,
                    // const Text(
                    //   'Coming on Friday',
                    //   style:
                    //       TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                    // ),
                    Kheight,
                    Text(
                      movieName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Kheight,
                    Text(
                      description == "" ? "No description Found" : description,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.grey, height: 1.3),
                    ),
                    Kheight,
                    const Text(
                      "Action\t Thriller\t  Drama \t SciFi \t Mystery \t Fantacy",
                      style: TextStyle(
                          color: Color.fromARGB(255, 179, 178, 178),
                          fontWeight: FontWeight.w900,
                          fontSize: 16),
                    ),
                    Kheight20
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class BuildCommingSoon extends StatelessWidget {
  const BuildCommingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context).add(const LoadDataCommingSoon());
    });
    return ListView(
      children: [
        Kheight30,
        const Text(
          "🍿 Coming Soon",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
        Kheight20,
        RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<HotandnewBloc>(context)
                .add(const LoadDataCommingSoon());
          },
          child: BlocBuilder<HotandnewBloc, HotandnewState>(
              builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            } else if (state.isError) {
              return const Center(
                child: Text('Error Getting Data '),
              );
            } else if (state.comingsoonList.isEmpty) {
              return const Center(
                child: Text('Error Getting Data '),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: state.comingsoonList.length,
                itemBuilder: (context, index) {
                  final movie = state.comingsoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  final formatedDate = DateFormat.MMMd('en_us')
                      .format(DateTime.parse(movie.releaseDate!));
                  return CommingSoonWidget(
                    id: movie.id.toString(),
                    month: formatedDate.split(' ').first.toUpperCase(),
                    day: formatedDate.split(' ')[1],
                    backgroundpath:
                        imageAppendUrl + movie.backdropPath.toString(),
                    movieName: movie.title ?? "hello",
                    description: movie.overview ?? 'No description',
                  );
                },
              );
            }
          }),
        )
      ],
    );
  }
}

class CommingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String backgroundpath;
  final String movieName;
  final String description;

  const CommingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.backgroundpath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(month,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  Text(day,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w900))
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                // height: 450,
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(backgroundpath),
                                  fit: BoxFit.cover)),
                          width: double.infinity,
                          height: 225,
                        ),
                        const Positioned(
                          bottom: 20,
                          right: 10,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.volume_mute_outlined,
                              size: 22,
                              color: color_white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Kheight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              movieName.toUpperCase(),
                              maxLines: 1,
                              style: const TextStyle(
                                  letterSpacing: -2,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: const [
                            CustomButtonWidget(
                              icon: Icons.notifications_outlined,
                              label: "Remind Me",
                              textsize: 12,
                            ),
                            kwidth,
                            kwidth,
                            kwidth,
                            CustomButtonWidget(
                              icon: Icons.info_outline,
                              label: "info",
                              textsize: 12,
                            ),
                            kwidth,
                          ],
                        )
                      ],
                    ),
                    Kheight,
                    Text(
                      'Coming on $day $month',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w100),
                    ),
                    Kheight,
                    Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Kheight,
                    Text(
                      description,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.grey, height: 1.3),
                    ),
                    Kheight,
                    const Text(
                      "Action\t Thriller\t  Drama \t SciFi   \t Fantasy",
                      style: TextStyle(
                          color: Color.fromARGB(255, 179, 178, 178),
                          fontWeight: FontWeight.w900,
                          fontSize: 16),
                    ),
                    Kheight30
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
