import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({Key? key,required this.controller,required this.hintText}) : super(key: key);
   final TextEditingController controller;
   final String hintText;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextField(
          controller: controller,
          decoration:  InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
          ),
        ),
      );
  }
}
