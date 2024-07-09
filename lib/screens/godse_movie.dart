import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/model/movie_collections_model.dart';
import 'package:streamflix/repository/streamflix_repository.dart';
import 'package:streamflix/screens/all_movies.dart';
import 'package:streamflix/screens/movies.dart';
import 'package:streamflix/screens/profilepage.dart';

import '../controller/streamflix_controller.dart';
import '../model/film_data_model.dart';
import '../widegts/container_txt.dart';
import '../widegts/description_txt.dart';

class GodseMovie extends StatefulWidget {
  const GodseMovie({super.key});

  @override
  State<GodseMovie> createState() => _GodseMovieState();
}

class _GodseMovieState extends State<GodseMovie> {


  final filmdataController = StreamflixController();
 //
 // FilmDataModel? _filmdata;
  bool loading = false;
  MovieCollectionModel? _movies;

  // Future<void> getCinemaData() async {
  //   try {
  //     loading = true;
  //     _filmdata = await filmdataController.fetchData();
  //     print(_filmdata);
  //     setState(() {
  //       loading = false;
  //     });
  //   } catch (e) {
  //     print("film data errorrrrr");
  //   }
  // }
  Future<void> getMovieData() async{
    try{
      loading = true;
      _movies = await filmdataController.getMovieCollection();
      print(_movies);
      setState(() {
        loading = false;
      });
    }catch(e){
      print("movie data error");
    }
  }
  @override
  void initState(){
   //getCinemaData();
    getMovieData();
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
                image: NetworkImage(_movies!.data![0].image!),
                height: 50.sp,
                width: 50.sp,
              ))
        ],
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Stack(
                children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          "More Movies",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          width: double.infinity,
                          height: 1500.sp,
                          child: GridView.count(
                              crossAxisCount: 3,
                              childAspectRatio: 3 / 5,
                              scrollDirection: Axis.vertical,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              shrinkWrap: true,
                              children: List.generate(_movies!.data!.length, (index) {
                                return TextButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieColletion(film_name: _movies!.data![index].filmName,),));
                                  },
                                  child: Container(
                                    height: 500.sp,
                                    width: 250.sp,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(_movies!.data![index].image!),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),

                                  ),
                                );
                              })),
                        ),
                      ),
                    ],
                  ),
              ),

    );
  }
}
