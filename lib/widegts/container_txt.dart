import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerText extends StatelessWidget {
  String txt;
  double height;
  double width;
  Color  color;


   ContainerText({
    super.key,required this.txt,required this.width,required this.height,required this.color
  });


  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: color,
          borderRadius: BorderRadius.circular(5)),
      height: height,
      width: width,
      child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 23.sp,fontWeight: FontWeight.bold),),
    );
  }
}


