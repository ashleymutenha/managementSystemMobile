import 'package:flutter/material.dart';


// class Fullname extends StatefulWidget {
//   const Fullname({super.key});

//   @override
//   State<Fullname> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<Fullname> {

//   final String name ="";
//   @override
//   Widget build(BuildContext context) {
//     return   Row(
//                         children: [
//                           const Card(
//                             color: Colors.green,
//                             child: Padding(
//                               padding: EdgeInsets.all(12.0),
//                               child:Icon(Icons.person_2,
//                              color:Colors.white,
//                              size: 26,
//                             ),
//                             ),
//                           ),

//                           Text(name,

                          
//                           )

                         
                          
//                         ],
//                       );
//   }
// }

class Fullname extends StatelessWidget {
  final String name;
  const Fullname({super.key,
  required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
                        children: [
                          const Card(
                            color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child:Icon(Icons.person_2,
                             color:Colors.white,
                             size: 26,
                            ),
                            ),
                          ),

                          Expanded(
                            child: Text(name,
                            style:const TextStyle(
                              fontSize: 23, 
                              color: Color.fromARGB(255, 71, 112, 72))),
                          )

                         
                          
                        ],
                      );
  }
}