import 'package:flutter/material.dart';


class MyHeader extends StatelessWidget {
  const MyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title:const Padding(
          padding: EdgeInsets.all(7),
          child:Row(
            children: [Text('Management System',
              style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
            ), SizedBox(width:30),

            Icon(Icons.cloud_circle_rounded, 
            size: 50,
            color:Color.fromARGB(255, 203, 227, 64))
            
            ],

          )
,
        ),
        backgroundColor: const Color.fromARGB(255, 26, 96, 29),
      );
  }
}