import 'package:flutter/material.dart';


class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Padding(padding: EdgeInsets.all(9),
    child:Divider(
     
      thickness: 2
    )
    );
  }
}
