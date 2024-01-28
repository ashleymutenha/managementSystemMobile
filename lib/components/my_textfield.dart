import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;


  const MyTextField({super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText}

  );



  @override
  Widget build(BuildContext context) {
    return   Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration:  InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:BorderSide(color:Color.fromARGB(255, 42, 128, 82)) ),
            focusedBorder: OutlineInputBorder(
              borderSide:BorderSide(color:Color.fromARGB(255, 129, 90, 136))
            ),
           fillColor: Colors.white,
           filled:true,
           hintText: hintText,
           hintStyle: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)
           
           ),),
         );
  }
}