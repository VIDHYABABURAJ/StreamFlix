import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/screens/john_homepage.dart';
import 'package:streamflix/utils/constance.dart';

import '../widegts/bottom_app_bar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
        Center(
        child: Image(
            image: AssetImage(streamflixImage), height: 250.sp, width: 250.sp,
            )),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(child: Text("Who's watching?",style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),)),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40,top: 20),
                      child: Container(
                        height: 250.sp,
                        width: 200.sp,
                        child: Column(
                          children: [
                            Image(image: AssetImage("asset/images/image 9.png"),height: 150.sp,width: 150.sp,),
                            TextButton(onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomBar() ,));
                            }, child:  Text("John",style: TextStyle(color: Colors.white,fontSize: 20)))
                          ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 250.sp,
                        width: 200.sp,
                        child: Column(
                          children: [
                            Image(image: AssetImage("asset/images/image 10.png"),height: 150.sp,width: 150.sp,),
                     TextButton(onPressed: (){},
                         child:  Text("Mike",style: TextStyle(color: Colors.white,fontSize: 20))
                             )
                          ],),
                      ),
                    ),
                  ],),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40,top: 20),
                      child: Container(
                        height: 250.sp,
                        width: 200.sp,
                        child: Column(
                          children: [
                            Image(image: AssetImage("asset/images/image 11.png"),height: 150.sp,width: 150.sp,),
                            TextButton(onPressed: (){}, child:  Text("Helina",style: TextStyle(color: Colors.white,fontSize: 20))
                           ,)
                          ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 250.sp,
                        width: 200.sp,
                        child: Column(
                          children: [
                            Image(image: AssetImage("asset/images/image 12.png"),height: 150.sp,width: 150.sp,),
                            TextButton(onPressed: (){
        
                            }, child:  Text("Kids",style: TextStyle(color: Colors.white,fontSize: 20))
                            )
                          ],),
                      ),
                    ),
                  ],),
        
              ],
            )
          ],
        ),
      ),
    );
  }
}
