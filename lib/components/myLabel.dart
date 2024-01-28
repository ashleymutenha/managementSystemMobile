import 'package:flutter/material.dart';


class MyLabel extends StatelessWidget {
  final String labelValue;

  const MyLabel({super.key,
  required this.labelValue
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(labelValue,
          style: const TextStyle(fontSize: 28,
          fontWeight: FontWeight.bold,
          
          color:Color.fromARGB(255, 34, 106, 57)),
          
          ),
        ],
      ),
    );
  }
}