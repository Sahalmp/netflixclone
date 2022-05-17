import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/downloads/screen_downloads.dart';
import 'package:netflixclone/presentation/fast_laugh/screen_fastlaugh.dart';
import 'package:netflixclone/presentation/home/screen_home.dart';
import 'package:netflixclone/presentation/main_page/widgets/bottam_nav.dart';
import 'package:netflixclone/presentation/newsandhot/screen_newsandhot.dart';
import 'package:netflixclone/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final _pages = [
    const ScreenHome(),
    const ScreenNewsAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
     ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (BuildContext context, int index, Widget? child) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
