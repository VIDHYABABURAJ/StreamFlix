import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamflix/screens/streemflix_signin.dart';
import 'package:streamflix/services/database.dart';
import 'package:streamflix/utils/constance.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final getdata = await dataBaseService.getAuth();
  print(getdata);

  runApp(ScreenUtilInit(
      designSize: Size(500, 1020),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: kPrimaryColour),
          home: StreamFlix(),
        );
      }));
}
