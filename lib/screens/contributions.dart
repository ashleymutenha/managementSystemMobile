
import 'package:flutter/material.dart';
import 'package:food/components/apiComponents/contribution.dart';
import 'package:http/http.dart' as http;

class UserContributions extends StatefulWidget {
  final String username;

  const UserContributions({super.key, required this.username});

  @override
  State<UserContributions> createState() => _UserContributionsState();
}

class _UserContributionsState extends State<UserContributions> {
 late Future<List<Contribution>?> futureContributions;
  @override
  void initState() {
    super.initState();
    futureContributions = getContributions();

  }

  Future<List<Contribution>?> getContributions() async {
    var client = http.Client();

    var uri = Uri.parse(
        "https://managementsystembackend-production.up.railway.app/contributions/ashleymutenha@gmail.com");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return contributionFromJson(json);
    }
    return null;
    // } else {
    //   throw Exception("Failed to Load Contributions Info");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(2),
            child: Row(
              children: [
                Text(
                  'Contributions Page',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 26, 96, 29),
        ),
        body: SingleChildScrollView(
            child: IntrinsicHeight(
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: FutureBuilder<List<Contribution>?>(
                        future: futureContributions,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  Text(snapshot.data![index].contribution
                                      .toString());
                                  return null;
                                  // return Card(
                                  //     child: Expanded(
                                  //         child: Padding(
                                  //             padding: EdgeInsets.all(9.0),
                                  //             child: Column(children: [
                                  //               const Row(
                                  //                   mainAxisAlignment:
                                  //                       MainAxisAlignment.start,
                                  //                   children: [
                                  //                     CircleAvatar(
                                  //                       backgroundColor:
                                  //                           Color.fromARGB(255,
                                  //                               188, 195, 189),
                                  //                       radius: 20,
                                  //                     ),
                                  //                   ]),
                                  //               Card(
                                  //                 color: const Color.fromARGB(
                                  //                     255, 59, 99, 60),
                                  //                 child: Padding(
                                  //                   padding: EdgeInsets.all(9),
                                  //                   child: Column(
                                  //                     children: [
                                  //                       const Row(
                                  //                         children: [
                                  //                           Text('Amount',
                                  //                               style: TextStyle(
                                  //                                   fontWeight:
                                  //                                       FontWeight
                                  //                                           .bold,
                                  //                                   fontSize:
                                  //                                       25,
                                  //                                   color: Color
                                  //                                       .fromARGB(
                                  //                                           255,
                                  //                                           128,
                                  //                                           209,
                                  //                                           21))),
                                  //                           SizedBox(width: 10),
                                  //                           CircleAvatar(
                                  //                             radius: 20,
                                  //                             backgroundColor:
                                  //                                 Color
                                  //                                     .fromARGB(
                                  //                                         255,
                                  //                                         234,
                                  //                                         231,
                                  //                                         231),
                                  //                             child: Icon(Icons.money_off,
                                  //                                 color: Color
                                  //                                     .fromARGB(
                                  //                                         255,
                                  //                                         23,
                                  //                                         88,
                                  //                                         16),
                                  //                                 size: 30),
                                  //                           )
                                  //                         ],
                                  //                       ),
                                  //                       const Divider(
                                  //                         height: 23,
                                  //                         color: Color.fromARGB(
                                  //                             255,
                                  //                             211,
                                  //                             229,
                                  //                             16),
                                  //                       ),
                                  //                       Text(
                                  //                           snapshot
                                  //                               .data![index]
                                  //                               .contribution
                                  //                               .toString(),
                                  //                           style: const TextStyle(
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .bold,
                                  //                               fontSize: 25,
                                  //                               color: Colors
                                  //                                   .white)),
                                  //                       SizedBox(width: 10)
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //               const SizedBox(height: 10),
                                  //               Card(
                                  //                 color: const Color.fromARGB(
                                  //                     255, 59, 99, 60),
                                  //                 child: Padding(
                                  //                   padding:
                                  //                       const EdgeInsets.all(9),
                                  //                   child: Column(
                                  //                     children: [
                                  //                       const Row(
                                  //                         children: [
                                  //                           Text('Date',
                                  //                               style: TextStyle(
                                  //                                   fontWeight:
                                  //                                       FontWeight
                                  //                                           .bold,
                                  //                                   fontSize:
                                  //                                       25,
                                  //                                   color: Color
                                  //                                       .fromARGB(
                                  //                                           255,
                                  //                                           128,
                                  //                                           209,
                                  //                                           21))),
                                  //                           SizedBox(width: 10),
                                  //                           CircleAvatar(
                                  //                             radius: 20,
                                  //                             backgroundColor:
                                  //                                 Color
                                  //                                     .fromARGB(
                                  //                                         255,
                                  //                                         234,
                                  //                                         231,
                                  //                                         231),
                                  //                             child: Icon(Icons.watch_rounded,
                                  //                                 color: Color
                                  //                                     .fromARGB(
                                  //                                         255,
                                  //                                         23,
                                  //                                         88,
                                  //                                         16),
                                  //                                 size: 30),
                                  //                           )
                                  //                         ],
                                  //                       ),
                                  //                       const Divider(
                                  //                         height: 23,
                                  //                         color: Color.fromARGB(
                                  //                             255,
                                  //                             211,
                                  //                             229,
                                  //                             16),
                                  //                       ),
                                  //                       Text(
                                  //                           snapshot
                                  //                               .data![index]
                                  //                               .created_at,
                                  //                           style: const TextStyle(
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .bold,
                                  //                               fontSize: 25,
                                  //                               color: Colors
                                  //                                   .white)),
                                  //                       SizedBox(width: 10)
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //               )
                                  //             ]))));
                                });
                          } else {
                            throw Exception("Error !");
                          }
                        })))));
  }
}

// Card(
//                         child: Expanded(
//                             child: Padding(
//                                 padding: EdgeInsets.all(9.0),
//                                 child: Column(children: [
//                                   Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         CircleAvatar(
//                                           backgroundColor: Color.fromARGB(
//                                               255, 188, 195, 189),
//                                           radius: 20,
//                                         ),
//                                       ]),
//                                   Card(
//                                     color: Color.fromARGB(255, 59, 99, 60),
//                                     child: Padding(
//                                       padding: EdgeInsets.all(9),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Text('Amount',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 25,
//                                                       color: Color.fromARGB(
//                                                           255, 128, 209, 21))),
//                                               SizedBox(width: 10),
//                                               CircleAvatar(
//                                                 radius: 20,
//                                                 child: Icon(Icons.money_off,
//                                                     color: Color.fromARGB(
//                                                         255, 23, 88, 16),
//                                                     size: 30),
//                                                 backgroundColor: Color.fromARGB(
//                                                     255, 234, 231, 231),
//                                               )
//                                             ],
//                                           ),
//                                           Divider(
//                                             height: 23,
//                                             color: Color.fromARGB(
//                                                 255, 211, 229, 16),
//                                           ),
//                                           Text('10',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 25,
//                                                   color: Colors.white)),
//                                           SizedBox(width: 10)
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Card(
//                                     color: Color.fromARGB(255, 59, 99, 60),
//                                     child: Padding(
//                                       padding: EdgeInsets.all(9),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Text('Date',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 25,
//                                                       color: Color.fromARGB(
//                                                           255, 128, 209, 21))),
//                                               SizedBox(width: 10),
//                                               CircleAvatar(
//                                                 radius: 20,
//                                                 child: Icon(Icons.watch_rounded,
//                                                     color: Color.fromARGB(
//                                                         255, 23, 88, 16),
//                                                     size: 30),
//                                                 backgroundColor: Color.fromARGB(
//                                                     255, 234, 231, 231),
//                                               )
//                                             ],
//                                           ),
//                                           Divider(
//                                             height: 23,
//                                             color: Color.fromARGB(
//                                                 255, 211, 229, 16),
//                                           ),
//                                           Text('2023-10-23',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 25,
//                                                   color: Colors.white)),
//                                           SizedBox(width: 10)
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ]))))
