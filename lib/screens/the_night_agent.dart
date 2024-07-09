import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/model/the_night_agent_model.dart';
import 'package:streamflix/screens/more_like_this.dart';
import 'package:streamflix/screens/profilepage.dart';
import 'package:streamflix/widegts/description_txt.dart';

import '../controller/streamflix_controller.dart';
import '../widegts/container_txt.dart';
import '../widegts/list_tile.dart';

class TheNightAgent extends StatefulWidget {
  const TheNightAgent({super.key});

  @override
  State<TheNightAgent> createState() => _TheNightAgentState();
}

class _TheNightAgentState extends State<TheNightAgent> {

  List img =[
    "asset/images/the call.png",
    "asset/images/redial.png",
    "asset/images/zookeeper.png",
    "asset/images/eyesOnly.jpg",
    "asset/images/theMarionette.jpg",
    "asset/images/Fathoms.jpg",
    "asset/images/bestdervedcold.jpg",
    "asset/images/redux.jpg",
    "asset/images/thedevilWeknow.jpg",
    "asset/images/fathers.jpg"
  ];
  final thenightagentcontroller = StreamflixController();

 List<TheNightAgentModel> ? _seriesdata;
 bool loading =false;

  Future<void> getSeriesData() async{
    try{
      loading = true;
      _seriesdata = await thenightagentcontroller.getData();
      setState(() {
        loading=false;
      });

    }catch(e){
      print("errorrrrr");
    }

  }
  @override
  void initState(){
    getSeriesData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search,size:40.sp ,)),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));},
              child: Image(image: AssetImage("asset/images/image 9.png"), height: 50.sp, width: 50.sp,))
        ],),
      body:loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Stack(
          children: [
        
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage("asset/images/the_night_agent.png")),
                LinearProgressIndicator(
                  backgroundColor: Color.fromRGBO(245, 98, 95, 1),
                  valueColor:AlwaysStoppedAnimation(Color.fromRGBO(199, 6, 2, 1)) ,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Text(_seriesdata![0].seriesName.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35.sp),),
                ),
                SizedBox(height: 10.sp,),
                Row(
                  children: [
                    ContainerText(height: 30.sp,width: 80.sp,txt: "2023",color: Colors.black,),
                    ContainerText(height: 30.sp,width: 90.sp,txt: "U/A16+",color: Colors.grey,),
                    ContainerText(height: 30.sp,width: 150.sp,txt: "10Episodes",color: Colors.black,),
                    Icon(Icons.hd_outlined,color: Colors.white,),
                    Image(image: AssetImage("asset/images/Audio Description.png"),height: 20.sp,),
                   Icon(Icons.subtitles,color: Colors.white,)
                  ],
                ),
                SizedBox(height: 10.sp,),
                Row(
                  children: [
                    Image(image: AssetImage("asset/images/streamflixS.png"),height: 35.sp,width: 35.sp,),
                    SizedBox(width: 5.sp,),
                    Text("S E R I E S",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(LinearBorder.none),
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        minimumSize: MaterialStatePropertyAll(Size(400.sp,60.sp)),
                      ),
                      onPressed: (){
                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.play_arrow_solid,color: Colors.black,),
                          Text("Play",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
        
                        ],
                      )
                      //Text("Get Started",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                ),
            ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(LinearBorder.none),
                        backgroundColor: MaterialStatePropertyAll(Colors.grey.withOpacity(0.3)),
                        minimumSize: MaterialStatePropertyAll(Size(400.sp,60.sp)),
                      ),
                      onPressed: (){},
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.arrow_down_square_fill,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Download S1:E1",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        ],
                      )
                  ),
                ),
                SizedBox(height: 10.sp,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20,right: 10),
                  child: DescriptionText(des_txt: _seriesdata![0].description.toString(),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5,left: 20,right: 10),
                  child:DescriptionText(des_txt:"Starring: ${_seriesdata![0].starring.toString()}" ,)
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5,left: 20,right: 10),
                  child: DescriptionText(des_txt: "Creator: ${_seriesdata![0].creator.toString()}",)
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            IconButton(onPressed: (){}, icon:Icon(Icons.add_rounded,color: Colors.white,size: 40.sp,),),
                            Text("My List",style: TextStyle(color: Colors.white,fontSize: 20.sp),)
                          ],),
                      ),
                      Spacer(),
                      Container(
                        child: Column(
                          children: [
                            IconButton(onPressed: (){}, icon:Icon(Icons.share,color: Colors.white,size: 40.sp,),),
                            Text("Share",style: TextStyle(color: Colors.white,fontSize: 20.sp),)
                          ],),
                      ),
                      Spacer(),
                      Container(
                        child: Column(
                          children: [
                            IconButton(onPressed: (){}, icon:Icon(CupertinoIcons.arrow_down_square_fill, color: Colors.white,size: 40.sp,),),
                            Text("All Episode",style: TextStyle(color: Colors.white,fontSize: 20.sp),)
                          ],),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.sp,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TheNightAgent(),));

                      }, child: Text("EPISODES",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),)),
                      Spacer(),
                      TextButton(
                          onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MoreLikeThis(),));

                      }, child: Text("MORE LIKE THIS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),))
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20),
                  child: Text(_seriesdata![0].seriesName.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                ),
                SizedBox(height: 20.sp,),
                Container(
                  height: 300.sp,
                  width: double.infinity,
                  child: ListView.builder(

                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Column(
                      children: [
                        ListTile(
                          leading: Image(image: AssetImage(img[index])),
                          title:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${_seriesdata![0].episodes![index].episodeNum}. ${_seriesdata![0].episodes![index].episodeName.toString()}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              Text(_seriesdata![0].episodes![index].episodeDuration.toString(),style: TextStyle(color: Colors.white),),
                            ],
                          ) ,
                          trailing: IconButton(onPressed: (){},icon: Icon(CupertinoIcons.arrow_down_to_line,color: Colors.white,),),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                            child:Text("${_seriesdata![0].episodes![index].episodeDescription.toString()}",
                              style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    );
                  },),
                ),
                SizedBox(height: 20.sp,),

            ]),
            Padding(
              padding: const EdgeInsets.only(top: 180,left: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(5)),
                    height: 30.sp,
                    width: 70.sp,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("Trailer",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text("30:06",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


