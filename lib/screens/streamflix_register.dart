import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streamflix/screens/streemflix_signin.dart';
import 'package:streamflix/services/database.dart';
import 'package:streamflix/services/firebaseServices.dart';
import 'package:streamflix/utils/constance.dart';
import 'package:streamflix/widegts/text_feild.dart';

import '../utils/firebasehelper.dart';

class StreamflixRegister extends StatefulWidget {
  const StreamflixRegister({super.key});

  @override
  State<StreamflixRegister> createState() => _StreamflixRegisterState();
}

class _StreamflixRegisterState extends State<StreamflixRegister> {
TextEditingController username=TextEditingController();
TextEditingController emailId=TextEditingController();
TextEditingController mobile =TextEditingController();
TextEditingController password =TextEditingController();

final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage(streamflixImage), height:150.sp, width: 200.sp,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:MaterialStatePropertyAll( RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                        minimumSize: MaterialStatePropertyAll(Size(40.sp,40.sp)),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StreamFlix(),));
                      },
                      child: Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:15),)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: _formKey,
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 50),
                  child:
                    TextFormFld(controller: username,validTxt: "username required",hintTxt: "username",)
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child:TextFormFld(controller: emailId,validTxt: "Emailid required",hintTxt: "Email Id",)),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child: TextFormFld(controller: mobile,validTxt: "mobile number required",hintTxt: "mobile number",)
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                  child: TextFormFld(controller: password,validTxt: "password required",hintTxt: "password",)
                ),
              ],
            )),
        
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(LinearBorder.none),
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    minimumSize: MaterialStatePropertyAll(Size(400.sp,60.sp)),
                  ),
                  onPressed: (){
                    streamflixRegistrationHandler();
        
                  },
                  child: Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account?",style: TextStyle(color: Colors.white,fontSize: 15),),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StreamFlix()));
                }, child:
                Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))
              ],
            ),
        
          ],),
      ),
    );
  }
  void  streamflixRegistrationHandler() async {
    try {
      await FireBase().userRegister(
          username: username.text,
          email: emailId.text,
          phone: mobile.text,
          password: password.text);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StreamFlix(),));
    } catch (e) {
      print(e);
      if (context.mounted) {
        custompopup(context: context, title: handleException(e));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'all fields are required',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
  }

