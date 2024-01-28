import 'package:flutter/material.dart';

class UserEmail extends StatelessWidget {
  final String email;
  const UserEmail({super.key,
  required this.email});

  @override
  Widget build(BuildContext context) {
    return Row(
                        children: [
                          const Card(
                            color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child:Icon(Icons.mail,
                             color:Colors.white,
                             size: 26,
                            ),
                            ),
                          ),

                          Expanded(
                            child: Text(email,
                            style:const TextStyle(
                              fontSize: 23, 
                              color: Color.fromARGB(255, 71, 112, 72))),
                          )

                         
                          
                        ],
                      );
  }
}