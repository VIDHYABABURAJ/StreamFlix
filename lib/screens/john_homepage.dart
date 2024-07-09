import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/screens/john_downloads.dart';
import 'package:streamflix/screens/john_library.dart';
import 'package:streamflix/screens/movies.dart';
import 'package:streamflix/screens/profilepage.dart';

import 'john_watchlist.dart';

class JohnHomePage extends StatefulWidget {
  const JohnHomePage({super.key});

  @override
  State<JohnHomePage> createState() => _JohnHomePageState();
}

class _JohnHomePageState extends State<JohnHomePage> {
  List myList = [
    Image(image: AssetImage("asset/images/jocker.png")),
    Image(image: AssetImage("asset/images/RRR.png")),
    Image(image: AssetImage("asset/images/avengers.png")),
    Image(image: AssetImage("asset/images/wednessday.png")),
    Image(image: AssetImage("asset/images/strangerthings.png")),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(children: [
              Image(image: AssetImage("asset/images/doctorstrange.png")),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(image: AssetImage("asset/images/streamflixS.png")),
                      SizedBox(
                        width: 280.sp,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.search,
                            size: 45.sp,
                            color: Colors.white,
                          )),
                      // SizedBox(
                      //   width: 10.sp,
                      // ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));

                      },
                          child: Image(
                        image: AssetImage("asset/images/image 9.png"),
                        height: 50.sp,
                        width: 50.sp,
                      )
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                          //  Navigator.push(context, MaterialPageRoute(builder: (context) =>WatchList() ,));
                          },
                          child: Text(
                            "TV Shows",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>MoviesPage() ,));
                          },
                          child: Text("Movies",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold))),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WatchList(),));
                          },
                          child: Row(
                            children: [
                              Text(
                                "Categories",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                CupertinoIcons.arrowtriangle_down_fill,
                                color: Colors.white,
                                size: 20.sp,
                              )
                            ],
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 300, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.bookmark_fill,
                          color: Colors.white,
                          size: 40.sp,
                        ),
                        Spacer(),
                        ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.only(left: 10, right: 10)),
                              shape: MaterialStatePropertyAll(LinearBorder()),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.play_arrow_solid,
                                  color: Colors.black,
                                ),
                                Text(
                                  "Play Now",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                )
                              ],
                            )),
                        Spacer(),
                        Icon(
                          CupertinoIcons.arrow_down_circle_fill,
                          color: Colors.white,
                          size: 40.sp,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 60),
                    child: Text(
                      "Trending Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 300.sp,
                    width: 500.sp,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: myList[index]
                        );
                      },
                    ),
                  ),
            
                ],
              )
            ]),
          ),
        ));
  }
}
