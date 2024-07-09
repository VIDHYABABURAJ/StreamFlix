import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/screens/godse_movie.dart';
import 'package:streamflix/screens/profilepage.dart';

import '../controller/streamflix_controller.dart';
import '../model/film_data_model.dart';
import '../widegts/container_txt.dart';
import '../widegts/description_txt.dart';

class MovieColletion extends StatefulWidget {
  final film_name;
   MovieColletion({super.key,required this.film_name});

  @override
  State<MovieColletion> createState() => _MovieColletionState();
}

class _MovieColletionState extends State<MovieColletion> {
  final filmdataController = StreamflixController();


  Data ? single_movieData;

  FilmDataModel? _filmdata;
  bool loading = false;

  Future<void> getCinemaData() async {
    try {
      loading = true;
      _filmdata = await filmdataController.fetchData();
      single_movieData=  _filmdata!.data!.firstWhere((element) => element.filmName== widget.film_name);
      print(single_movieData!.filmName);
      setState(() {
        loading = false;
      });
    } catch (e) {
      print("film data errorrrrr");
    }
  }

  @override
  void initState() {
    getCinemaData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.search,
                size: 40.sp,
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ));
              },
              child: Image(
                image: AssetImage("asset/images/image 9.png"),
                height: 50.sp,
                width: 50.sp,
              ))
        ],
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Stack(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 250.sp,
                        width: double.infinity,
                        child: Image(image:NetworkImage(single_movieData!.image!),fit: BoxFit.fill)),
                    LinearProgressIndicator(
                      backgroundColor: Color.fromRGBO(245, 98, 95, 1),
                      valueColor:
                          AlwaysStoppedAnimation(Color.fromRGBO(199, 6, 2, 1)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(single_movieData!.filmName!,
                        // _filmdata!.data![0].filmName.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35.sp),
                      ),
                    ),
                    Row(
                      children: [
                        ContainerText(
                          height: 30.sp,
                          width: 80.sp,
                          txt: single_movieData!.releaseYear.toString(),
                          color: Colors.black,
                        ),
                        ContainerText(
                          height: 30.sp,
                          width: 90.sp,
                          txt: "U/A16+",
                          color: Colors.grey,
                        ),
                        //ContainerText(height: 30.sp,width: 150.sp,txt: "10Episodes",color: Colors.black,),
                        Icon(
                          Icons.hd_outlined,
                          color: Colors.white,
                        ),
                        Image(
                          image:
                              AssetImage("asset/images/Audio Description.png"),
                          height: 20.sp,
                        ),
                        Icon(
                          Icons.subtitles,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 60.sp,
                        ),
                        Image(
                          image: AssetImage("asset/images/streamflixS.png"),
                          height: 35.sp,
                          width: 35.sp,
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                        Text(
                          "M O V I E",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(LinearBorder.none),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            minimumSize:
                                MaterialStatePropertyAll(Size(400.sp, 60.sp)),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.play_arrow_solid,
                                color: Colors.black,
                              ),
                              Text(
                                "Play",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(LinearBorder.none),
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.grey.withOpacity(0.3)),
                            minimumSize:
                                MaterialStatePropertyAll(Size(400.sp, 60.sp)),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.arrow_down_square_fill,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Download ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: DescriptionText(
                        des_txt:single_movieData!.description.toString(),
                      ),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 20, right: 10),
                        child: DescriptionText(
                          des_txt:
                              "Starring: ${single_movieData!.starring.toString()}",
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 20, right: 10),
                        child: DescriptionText(
                          des_txt: "Creator: ${single_movieData!.creator}",
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Row(children: [
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_rounded,
                                  color: Colors.white,
                                  size: 40.sp,
                                ),
                              ),
                              Text(
                                "My List",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 40.sp,
                                ),
                              ),
                              Text(
                                "Share",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GodseMovie(),));
                                },
                                icon: Icon(
                                  Icons.file_copy,
                                  color: Colors.white,
                                  size: 40.sp,
                                ),
                              ),
                              Text(
                                "All Movies",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              )
                            ],
                          ),
                        ),
                      ]),
                    )
                  ]),
            ])),
    );
  }
}
