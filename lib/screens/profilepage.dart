import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text("Profile & More",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

      ),
      body:
      Column(
        children: [
          SizedBox(height: 30,),
          Row(
            children: [
              TextButton(onPressed: (){},
                  child: Column(
                    children: [
                      Image(image: AssetImage("asset/images/image 9.png"),height: 90.sp,width: 90.sp,),
                      SizedBox(height: 5,),
                      Text("John",style: TextStyle(color: Colors.white),)
                    ],
                  )),
              TextButton(onPressed: (){},
                  child: Column(
                    children: [
                      Image(image: AssetImage("asset/images/image 10.png"),height: 90.sp,width: 90.sp,),
                      SizedBox(height: 5,),
                      Text("Mike",style: TextStyle(color: Colors.white),)
                    ],
                  )),
              TextButton(onPressed: (){},
                  child: Column(
                    children: [
                      Image(image: AssetImage("asset/images/image 11.png"),height: 90.sp,width: 90.sp,),
                      SizedBox(height: 5,),
                      Text("Helina",style: TextStyle(color: Colors.white),)
                    ],
                  )),
              TextButton(onPressed: (){},
                  child: Column(
                    children: [
                      Image(image: AssetImage("asset/images/image 12.png"),height: 90.sp,width: 90.sp,),
                      SizedBox(height: 5,),
                      Text("Kids",style: TextStyle(color: Colors.white),)
                    ],
                  ))
            ],
          ),
        SizedBox(height: 30,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.manage_accounts,color: Colors.white,size: 30,),
            Text("Manage Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
          ],
        ),
        SizedBox(height: 50,),
        Container(
          height: 400.sp,
          width: double.infinity,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.notifications,color: Colors.white,size: 20,),
                title: Text("Notification",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              //SizedBox(height: 20,),
              ListTile(
                leading: Icon(Icons.list,color: Colors.white,size: 20,),
                title: Text("My List",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              ListTile(
                leading: Icon(Icons.settings,color: Colors.white,size: 20,),
                title: Text("App Settings",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              ListTile(
                leading: Icon(Icons.account_box,color: Colors.white,size: 20,),
                title: Text("Account",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              ListTile(
                leading: Icon(Icons.help,color: Colors.white,size: 20,),
                title: Text("Help",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ],
          ),
        ),
          TextButton(onPressed: (){}, child: Text("Sign Out",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),))
        ],
      ),

    );
  }
}
