import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  String img;
  String name_txt;
  String txt;
  ListTileWidget({
    super.key,required this.txt,required this.img,required this.name_txt
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(image: AssetImage(img)),
      title:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name_txt,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          Text(txt,style: TextStyle(color: Colors.white),)
        ],
      ) ,
      trailing: IconButton(onPressed: (){},icon: Icon(CupertinoIcons.arrow_down_to_line,color: Colors.white,),),
    );
  }
}


