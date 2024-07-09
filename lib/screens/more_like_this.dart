import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/screens/profilepage.dart';

class MoreLikeThis extends StatefulWidget {
  const MoreLikeThis({super.key});

  @override
  State<MoreLikeThis> createState() => _MoreLikeThisState();
}

class _MoreLikeThisState extends State<MoreLikeThis> {
  @override
  Widget build(BuildContext context) {
    List morelike=[
      "asset/images/brahmasthra.png",
      "asset/images/master.png",
      "asset/images/bellbottom.png",
      "asset/images/bachchanpandey.png",
      "asset/images/zero.png",
      "asset/images/Circus.png",
      "asset/images/kahani.png",
      "asset/images/agent.png",
      "asset/images/lostcity.png",
      "asset/images/criminal.png",
      "asset/images/RRR.png",
      "asset/images/radheShyam.png"
    ];

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search,size:40.sp ,)),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));},
              child: Image(image: AssetImage("asset/images/image 9.png"), height: 50.sp, width: 50.sp,))
        ],),

      body:  SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("More Like This",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30.sp),),
            ),
           Container(
             padding: EdgeInsets.only(top: 20),
             width: double.infinity,
             height: 2000.sp,
             child: GridView.count(
               crossAxisCount: 3,
               childAspectRatio:3/5,
               scrollDirection: Axis.vertical,
                 crossAxisSpacing: 10.0,
                 mainAxisSpacing: 10.0,
                 shrinkWrap: true,
                 children: List.generate(morelike.length, (index){
                   return Container(
                    height: 500.sp,
                     width: 200.sp,
                     decoration: BoxDecoration(
                       image:DecorationImage(image: AssetImage(morelike[index]),fit: BoxFit.fill,),
                       borderRadius: BorderRadius.circular(20),
                     ),
                   );

                 }
             )

             ),
           ),
            
          ],
        ),
      ),
    );
  }
}




// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/brahmasthra.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/master.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/bellbottom.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/bachchanpandey.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/zero.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/Circus.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/kahani.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/agent.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/lostcity.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/criminal.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/RRR.png"))),
// TextButton(onPressed: (){}, child: Image(image: AssetImage("asset/images/radheShyam.png"))),

// Image(image: AssetImage("asset/images/brahmasthra.png")),
// Image(image: AssetImage("asset/images/master.png")),
// Image(image: AssetImage("asset/images/bellbottom.png")),
// Image(image: AssetImage("asset/images/bachchanpandey.png")),
// Image(image: AssetImage("asset/images/zero.png")),
// Image(image: AssetImage("asset/images/Circus.png")),