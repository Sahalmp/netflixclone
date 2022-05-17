import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/main_page/screen_main_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.transparent),
          scaffoldBackgroundColor: backgroundcolor,
          backgroundColor: Colors.black,
          fontFamily: GoogleFonts.roboto().fontFamily,
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(color: Colors.white))),
      home: ScreenMainPage(),
    );
  }
}
