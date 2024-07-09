import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/screens/more_like_this.dart';
import 'package:streamflix/screens/movies.dart';

import '../screens/john_downloads.dart';
import '../screens/john_homepage.dart';
import '../screens/john_library.dart';
import '../screens/john_watchlist.dart';
import '../utils/constance.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectindex = 0;
  List _page = [
    JohnHomePage(),
    WatchList(),
    MoreLikeThis(),
    DownloadsPage(),

  ];

  changeTab(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _page[_selectindex],
    bottomNavigationBar:   BottomNavigationBar(
          currentIndex: _selectindex,
          onTap: (index) => changeTab(index),
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
                icon: Icon(
                  CupertinoIcons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                ),
                label: "Watchlist"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  CupertinoIcons.circle_grid_3x3,
                ),
                label: "Library"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  CupertinoIcons.arrow_down_circle_fill,
                ),
                label: "Download")
          ]),
    );
  }
}
