import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/screens/profilepage.dart';
import 'package:streamflix/screens/the_night_agent.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {

  List myList=[
     Image(image: AssetImage("asset/images/suicidesquad.png")),
     Image(image: AssetImage("asset/images/nichmen.png")),
    Image(image: AssetImage("asset/images/blackwidow.png")),
  ];
  List fantacyHorror=[
      Image(image: AssetImage("asset/images/strangerthings.png")),
   Image(image: AssetImage("asset/images/Lucifer.png")),
Image(image: AssetImage("asset/images/squa..me.png")),
  ];


  
  @override
  Widget build(BuildContext context) {
    List crimeDrama=[
      TextButton(onPressed: (){}, child:  Image(image: AssetImage("asset/images/Elite.png")),),
      TextButton(onPressed: (){}, child:  Image(image: AssetImage("asset/images/wednessday.png")),),
      TextButton(onPressed: (){}, child:  Image(image: AssetImage("asset/images/riverdale.png")),),
      TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TheNightAgent(),));
        }, child:  Image(image: AssetImage("asset/images/nightagent.jpg")),),
    ];


    return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
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
          icon: Icon(CupertinoIcons.search, size: 45.sp, color: Colors.white,
          )),

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
    //SizedBox(height: 10,),
    Padding(
      padding: const EdgeInsets.only(top: 20,left: 10),
      child: Text("Crime & Drama TV Shows",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
    ),
              Container(
                  padding: EdgeInsets.only(top: 20),
                height: 250.sp,
                  width: 900.sp,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: crimeDrama.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 300.sp,
                        width: 180.sp,
                        child: crimeDrama[index]
                        // child: TextButton(onPressed: (){
                        //  Navigator.push(context,MaterialPageRoute(builder:(context) => , ));
                        // },child:  crimeDrama[index],),
                      );
                    },
                  )),

              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10),
                child: Text("My List",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 250.sp,
                  width: 800.sp,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 300.sp,
                        width: 180.sp,
                        child:myList[index] ,
                      );

                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10),
                child: Text("Su-Fi, Fantacy & Horror",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 250.sp,
                  width: 800.sp,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fantacyHorror.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 300.sp,
                        width: 180.sp,
                        child:fantacyHorror[index] ,
                      );

                    },
                  ))
            ]
    ),
      ),
    ),
    );
  }
}
