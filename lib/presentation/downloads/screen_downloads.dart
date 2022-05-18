import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/application/downloads/downloads_bloc.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          //Appbar

          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarWidget(
              title: 'Downloads',
            ),
          ),

          //Body

          body: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx, index) => _widgetList[index],
              separatorBuilder: (ctx, index) => const SizedBox(
                    height: 60,
                  ),
              itemCount: _widgetList.length)),
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Kheight,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Set Up',
                  style: TextStyle(
                      color: color_white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              color: button_color_blue),
        ),
        Kheight,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'See What You can Download',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              color: color_white),
        ),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Indroducing Downloads for You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: color_white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Kheight,
        const Text(
          "We'll download a personalized selection of\n movies and shows for you, so there's always\n something to watch on your device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.2,
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
        Kheight,
        Kheight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return state.isLoading == true || state.downloads.isEmpty
                ? const CircularProgressIndicator()
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        radius: size.width * 0.32,
                      ),
                      DownloadsImageWidget(
                        margin: const EdgeInsets.only(
                            right: 150, bottom: 35, top: 20),
                        imageurl:
                            '$imageAppendUrl/${state.downloads[0].posterPath}',
                        rotation: -20,
                        size: Size(
                          size.width * 0.33,
                          size.width * 0.43,
                        ),
                      ),
                      DownloadsImageWidget(
                        margin: const EdgeInsets.only(
                            left: 150, bottom: 35, top: 20),
                        imageurl:
                            '$imageAppendUrl/${state.downloads[1].posterPath}',
                        rotation: 20,
                        size: Size(size.width * 0.33, size.width * 0.45),
                      ),
                      DownloadsImageWidget(
                        margin: EdgeInsets.only(top: 20),
                        imageurl:
                            '$imageAppendUrl/${state.downloads[2].posterPath}',
                        rotation: 0,
                        size: Size(size.width * 0.33, size.width * 0.5),
                      ),
                    ],
                  );
          },
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings_outlined,
          color: color_white,
        ),
        kwidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.margin,
    this.rotation = 0,
    required this.imageurl,
    required this.size,
  }) : super(key: key);
  final Size size;
  final String imageurl;
  final double rotation;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(imageurl), fit: BoxFit.cover)),
      ),
    );
  }
}
