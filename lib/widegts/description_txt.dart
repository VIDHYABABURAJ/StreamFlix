
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionText extends StatelessWidget {
  String des_txt;
  DescriptionText ({
    super.key,required this.des_txt
  });

  @override
  Widget build(BuildContext context) {
    return Text(des_txt,
      style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),);
  }
}