import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/application/downloads/downloads_bloc.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/domain/core/di/injectable.dart';
import 'package:netflixclone/presentation/main_page/screen_main_page.dart';

import 'application/Search/search_bloc.dart';
import 'application/fastlaugh/fastlaugh_bloc.dart';
import 'application/home/home_bloc.dart';
import 'application/newandhot/bloc/hotandnew_bloc.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DownloadsBloc>()),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
        BlocProvider(create: (context) => getIt<FastlaughBloc>()),
        BlocProvider(create: (context) => getIt<HotandnewBloc>()),
                BlocProvider(create: (context) => getIt<HomeBloc>()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Colors.transparent),
            scaffoldBackgroundColor: backgroundcolor,
            backgroundColor: Colors.black,
            fontFamily: GoogleFonts.roboto().fontFamily,
            textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                ),
                bodyText2: TextStyle(color: Colors.white))),
        home: ScreenMainPage(),
      ),
    );
  }
}
