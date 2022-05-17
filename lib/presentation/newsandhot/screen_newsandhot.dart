import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/home/screen_home.dart';
import 'package:netflixclone/presentation/search/widgets/search_idle.dart';

import '../../core/constants.dart';

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
                  icon: Icon(Icons.cast, color: Colors.white)),
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
              preferredSize: Size.fromHeight(50),
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
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
              BuildCommingSoon(),
              BuildEveryOneWatching(),
            ],
          )),
    );
  }
}

class BuildEveryOneWatching extends StatelessWidget {
  const BuildEveryOneWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView(
        children: [
          Kheight30,
          const Text(
            "🍿 Everyone's Watching",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Kheight20,
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 450,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: NetworkImage(imageUrl),
                                            fit: BoxFit.cover)),
                                    width: double.infinity,
                                    height: 200,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'TALL GIRL 2',
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
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
                              Kheight,
                              const Text(
                                'Coming on Friday',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w100),
                              ),
                              Kheight,
                              const Text(
                                'Tall Girl 2',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              Kheight,
                              const Text(
                                'anxnxjznjaxnjznjxnjxjzxnmjx njmn jzxn jmxn jmnxjmnxjmszxszjmnx jmnxjmnzsjmnxj xnmnsjnjcnjxnjnxjxnjxnjsnxjmj nxjjxjx njszxjxjsxjxjmxxj zsnhbhhjxnn',
                                maxLines: 5,
                                style:
                                    TextStyle(color: Colors.grey, height: 1.3),
                              ),
                              Kheight,
                              const Text(
                                "Action\t Thriller\t  Drama \t SciFi \t Mystery \t Fantacy",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 179, 178, 178),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class BuildCommingSoon extends StatelessWidget {
  const BuildCommingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Kheight30,
        const Text(
          "🍿 Coming Soon",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Kheight20,
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('APR',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                          Text('15',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 450,
                      width: MediaQuery.of(context).size.width - 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image: NetworkImage(imageUrl),
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
                              const Text(
                                'TALL GIRL 2',
                                style: TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
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
                          const Text(
                            'Coming on Friday',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w100),
                          ),
                          Kheight,
                          const Text(
                            'Tall Girl 2',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                          Kheight,
                          const Text(
                            'anxnxjznjaxnjznjxnjxjzxnmjx njmn jzxn jmxn jmnxjmnxjmszxszjmnx jmnxjmnzsjmnxj xnmnsjnjcnjxnjnxjxnjxnjsnxjmj nxjjxjx njszxjxjsxjxjmxxj zsnhbhhjxnn',
                            maxLines: 5,
                            style: TextStyle(color: Colors.grey, height: 1.3),
                          ),
                          Kheight,
                          const Text(
                            "Action\t Thriller\t  Drama \t SciFi \t Mystery \t Fantacy",
                            style: TextStyle(
                                color: Color.fromARGB(255, 179, 178, 178),
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
