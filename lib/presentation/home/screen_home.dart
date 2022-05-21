import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/application/home/home_bloc.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/background_card.dart';
import 'package:netflixclone/presentation/home/widgets/home_page_card_title.dart';
import 'package:netflixclone/presentation/home/widgets/number_card.dart';
import 'package:netflixclone/presentation/home/widgets/title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const Gethomescreendata());
      BlocProvider.of<HomeBloc>(context).add(const Gethomescreendata());
    });

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: ((context, value, child) {
              return SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: NotificationListener<UserScrollNotification>(
                  onNotification: ((notification) {
                    final ScrollDirection direction = notification.direction;

                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }

                    // print(direction);

                    return true;
                  }),
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BlocBuilder<HomeBloc, HomeState>(
                              builder: (context, state) {
                                
                                      

                                if (state.isLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2),
                                  );
                                } else if (state.hasError) {
                                  return const Center(
                                    child: Text('Error Getting Data '),
                                  );
                                }
                                final _topnetflixMovies =
                                    state.topnetflixmovieslist.map((m) {
                                  return '$imageAppendUrl${m.posterPath}';
                                }).toList();
                                final _trendingnow =
                                    state.trendingnowlist.map((m) {
                                  return '$imageAppendUrl${m.posterPath}';
                                }).toList();
                                final _tvshowsbasedonbooks =
                                    state.tvshowsbasedonbookslist.map((m) {
                                  return '$imageAppendUrl${m.posterPath}';
                                }).toList();
                                final _usmovies = state.usmovielist.map((m) {
                                  return '$imageAppendUrl${m.posterPath}';
                                }).toList();
                                final _top10 = state.top10list.map((m) {
                                  return '$imageAppendUrl${m.posterPath}';
                                }).toList();
                                final newreleases =
                                    state.newreleaseslist.map((m) {
                                  return '$imageAppendUrl${m.posterPath}';
                                }).toList();
                                final _tvdramas = state.tvdramaslist.map((m) {
                                  return '$imageAppendUrl${m.posterPath}';
                                }).toList();

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BackgroundCard(
                                      posterPath: _top10[0],
                                    ),
                                    Kheight20,
                                    HomeCardTitle(
                                      title: 'Top Netflix Movies',
                                      posterList: _topnetflixMovies,
                                    ),
                                    Kheight,
                                    HomeCardTitle(
                                      title: 'Trending Now',
                                      posterList: _trendingnow.sublist(0, 10),
                                    ),
                                    Kheight,
                                    HomeCardTitle(
                                      title: 'TV Shows Based on Books',
                                      posterList: _tvshowsbasedonbooks,
                                    ),
                                    Kheight,
                                    HomeCardTitle(
                                      title: 'New Releases',
                                      posterList: newreleases.sublist(0, 10),
                                    ),
                                    Kheight,
                                    HomeCardTitle(
                                      title: 'TV Dramas',
                                      posterList: _tvdramas,
                                    ),
                                    Kheight,
                                    const HomePageTitle(title: 'Top 10 Today'),
                                    Kheight,
                                    HomeNumberCard(
                                      posterpath: _top10,
                                    ),
                                    Kheight,
                                    HomeCardTitle(
                                      title: 'US Movies',
                                      posterList: _usmovies.sublist(0, 10),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      scrollNotifier.value
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                    Colors.black.withOpacity(0.4),
                                    Colors.black.withOpacity(0.1)
                                  ])),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      kwidth,
                                      Image.network(
                                        "https://www.edigitalagency.com.au/wp-content/uploads/Netflix-N-Symbol-logo-red-transparent-RGB-png.png",
                                        width: 40,
                                      ),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.cast,
                                              color: Colors.white)),
                                      kwidth,
                                      Container(
                                        height: 24,
                                        width: 24,
                                        child: Image.asset(
                                          "asset/images/profileavatar.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      kwidth,
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        "TV Shows",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Text("Movies",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                      LimitedBox(
                                        child: Row(children: const [
                                          Text("Categories",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500)),
                                          Icon(
                                            Icons.arrow_drop_down_rounded,
                                            color: color_white,
                                          )
                                        ]),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Kheight
                    ],
                  ),
                ),
              ));
            })));
  }
}

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final double iconsize;
  final double textsize;
  const CustomButtonWidget(
      {Key? key,
      required this.icon,
      required this.label,
      this.iconsize = 25,
      this.textsize = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color_white,
          size: iconsize,
        ),
        Text(
          label,
          style: TextStyle(color: color_white, fontSize: textsize),
        ),
      ],
    );
  }
}
