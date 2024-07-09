import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFld extends StatelessWidget {
 TextFormFld({
    super.key,
    required this.controller,
    required this.validTxt,
   required this.hintTxt,
  });

  final TextEditingController controller;
  String validTxt;
  String hintTxt;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return value!.isEmpty ? validTxt : null;
      },style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.4),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          hintText: hintTxt,
          hintStyle: TextStyle(color: Colors.white),


      ),
    );
  }
}
