import 'package:flutter/material.dart';

class UserPhone extends StatelessWidget {
  final String phone;
  const UserPhone({super.key,
  required this.phone});

  @override
  Widget build(BuildContext context) {
    return Row(
                        children: [
                          const Card(
                            color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child:Icon(Icons.phone,
                             color:Colors.white,
                             size: 26,
                            ),
                            ),
                          ),

                          Expanded(
                            child: Text(phone,
                            style:const TextStyle(
                              fontSize: 23, 
                              color: Color.fromARGB(255, 71, 112, 72))),
                          )

                         
                          
                        ],
                      );
  }
}