import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/screens/more_like_this.dart';
import 'package:streamflix/screens/profilepage.dart';
import 'package:streamflix/widegts/list_tile.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({super.key});

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title:Text("Downloads",style: TextStyle(color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search,size:40.sp ,)),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));},
              child: Image(image: AssetImage("asset/images/image 9.png"), height: 50.sp, width: 50.sp,))
        ],),

      body: SafeArea(
        child: Stack(
          children:[ Column(
            children: [
          ListTile(
          leading: Image(image: AssetImage("asset/images/intersteller.png"),height: 200.sp,width: 150.sp,),
                title:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Intersteller",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("13+ | 1.45 GB",style: TextStyle(color: Colors.white),)
          ],
                ) ,
                trailing: IconButton(onPressed: (){},icon: Icon(Icons.phone_iphone_sharp,color: Colors.white,size: 40.sp,),),
              ),
              SizedBox(width: 80.sp,),
              ListTile(
                leading: Image(image: AssetImage("asset/images/mortal kombat.png"),height: 200.sp,width: 150.sp,),
                title:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mortal Kombat",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("16+ | 1.75 GB",style: TextStyle(color: Colors.white),)
                  ],
                ) ,
                trailing: IconButton(onPressed: (){},icon: Icon(Icons.phone_iphone_sharp,color: Colors.white,size: 40.sp,),),
              ),

            ],
          ),
            Padding(
              padding: const EdgeInsets.only(top: 250,left: 60),
              child: Image(image: AssetImage("asset/images/Ellipse 1.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 280,left: 10),
              child: Image(image: AssetImage("asset/images/avengers(r).png")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 280,left: 200),
              child: Image(image: AssetImage("asset/images/Moonnight.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 280,left: 130),
              child: Image(image: AssetImage("asset/images/udaan.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 570),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(LinearBorder.none),
                    backgroundColor: MaterialStatePropertyAll(Colors.grey.withOpacity(0.3)),
                    minimumSize: MaterialStatePropertyAll(Size(400.sp,60.sp)),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>MoreLikeThis() ,));
                  },
                  child:Text("Find More To Download",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

              ),
            ),
    ]
        ),

      ),
    );
  }
}
