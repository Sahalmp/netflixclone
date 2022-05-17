import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (BuildContext context, int newIndex, Widget? child) {
        return BottomNavigationBar(
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home_filled),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.photo_fill_on_rectangle_fill),
                icon: Icon(CupertinoIcons.photo_on_rectangle),
                label: 'New & Hot',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.smiley_fill),
                icon: Icon(CupertinoIcons.smiley),
                label: 'Fast Laughs',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.arrow_down_circle_fill),
                icon: Icon(CupertinoIcons.arrow_down_circle),
                label: 'Downloads',
              )
            ]);
      },
    );
  }
}
