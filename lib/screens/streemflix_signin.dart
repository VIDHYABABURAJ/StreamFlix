import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streamflix/screens/streamflix_register.dart';
import 'package:streamflix/screens/streamflix_splashpage.dart';
import 'package:streamflix/services/database.dart';
import 'package:streamflix/utils/constance.dart';

import '../services/firebaseServices.dart';
import '../utils/firebasehelper.dart';
import '../widegts/text_feild.dart';

class StreamFlix extends StatefulWidget {
  const StreamFlix({super.key});

  @override
  State<StreamFlix> createState() => _StreamFlixState();
}

class _StreamFlixState extends State<StreamFlix> {
  final FireBase _authService = FireBase();
  
  TextEditingController email=TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading = false;
  bool _isValid = false;
  bool _isemail = false;
  String emailError = '';
  String _errorMsg = '';

  final _formKey = GlobalKey<FormState>();
  
  void validateEmail() {
    if (email.text.isEmpty) {
      setState(() {
        emailError = 'Email required';
      });
    } else if (!isEmailValid()) {
      setState(() {
        emailError = 'Enter a valid email address';
      });
    } else {
      setState(() {
        emailError = '';
      });
    }
  }
  bool isEmailValid() {
    return RegExp(r'^[\w-]+@[a-zA-Z]+\.[a-zA-Z]{2,}$')
        .hasMatch(email.text);
  }

  bool validatepassword() {
    _errorMsg = '';
    if (password.text.length < 6) {
      _errorMsg += '. Password must be longer than 6 charecters\n';
    }
    if (!password.text.contains(RegExp('[A-Z]'))) {
      _errorMsg += '. Upper case Letter is missing\n';
    }
    if (!password.text.contains(RegExp('[a-z]'))) {
      _errorMsg += '. Lower case letter is missing\n';
    }
    if (!password.text.contains(RegExp('[0-9]'))) {
      _errorMsg += '• Digit is missing.\n';
    }
    if (!password.text.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      _errorMsg += '• Special character is missing.\n';
    }
    return _errorMsg.isEmpty;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Center(
                    child: Image(
                  image: AssetImage(streamflixImage),
                  height: 350.sp,
                  width: 350.sp,
                ))),
            Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold),
            ),
            Form(
              key: _formKey,
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                child: TextFormFld(controller: email,hintTxt: "Email Id",validTxt: "Email required",),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                child:TextFormFld(controller: password,hintTxt: "password",validTxt: "Password required",)
        
              ),
        
          ]
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
                  signInHandler();
                  },
                  child: Text("Get Started",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("OR",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(LinearBorder.none),
                    backgroundColor: MaterialStatePropertyAll(Colors.grey.withOpacity(0.3)),
                    minimumSize: MaterialStatePropertyAll(Size(400.sp,60.sp)),
                  ),
                  onPressed: () async {
                    try{
                      User? user = await _authService.signinWithGoogle();

                      print(user);
                      if(user!= null){
                        print("Signin successfull");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SplashPage(),));
                      }else {

                        print("signin failed");
                      }
                    }catch(e){
                      print("aaa");
                      print(e);
                    }
                  },
                  child: Text("SignIn with Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New to StreamFLix?",style: TextStyle(color: Colors.white,fontSize: 15),),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StreamflixRegister()));
                }, child:
                Text("Sign Up Now",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))
              ],
            ),
        
          ],
        ),
      ),
    );
  }
  void signInHandler() async {
    print(validatepassword());

    _isValid = true;
    validateEmail();
    print("aaa");

    if (_isValid && emailError.isEmpty) {
      try {
        setState(() {
          loading = true;
        });
        await FireBase().loginValidation(
            email: email.text, password: password.text);
        print("login");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SplashPage(),
            ));
        setState(() {
          loading = false;
        });
      } on FirebaseAuthException catch (e) {
        if (context.mounted) {
          custompopup(context: context, title: handleException(e));
        }
        setState(() {
          loading = false;
        });
      }
    } else {
      if (emailError.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            '$emailError',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          backgroundColor: Colors.red,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            '$_errorMsg',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}

