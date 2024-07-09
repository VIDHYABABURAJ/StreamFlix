import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/screens/godse_movie.dart';
import 'package:streamflix/screens/john_watchlist.dart';
import 'package:streamflix/screens/profilepage.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List indianMovie =[
    Image(image: AssetImage("asset/images/radheShyam.png")),
    Image(image: AssetImage("asset/images/criminal.png")),
    Image(image: AssetImage("asset/images/raazi.png")),
    Image(image: AssetImage("asset/images/RRR.png")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image(image: AssetImage("asset/images/moviesbg.png")),
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
                    onPressed: () {

                    },
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
                    child:
                Image(
                  image: AssetImage("asset/images/image 9.png"),
                  height: 50.sp,
                  width: 50.sp,
                )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>GodseMovie() ,));
                    },
                    child: Row(
                      children: [
                        Text("Movies",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                        Icon(
                          CupertinoIcons.arrowtriangle_down_fill,
                          color: Colors.white,
                          size: 20.sp,
                        )
                      ],
                    )),
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
              padding: const EdgeInsets.only(top: 320, left: 20, right: 20),
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
              padding: const EdgeInsets.only(left: 20, top: 50),
              child: Text(
                "Indian Movie",
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
                itemCount: indianMovie.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: indianMovie[index]
                  );
                },
              ),
            ),


              
            ],
          ),
        ]
        ),
      )
    ),
    );
  }
}
