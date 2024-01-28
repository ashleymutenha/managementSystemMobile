import 'package:flutter/material.dart';
import 'package:food/components/userDetailsComponents/email.dart';
import 'package:food/components/userDetailsComponents/fullname.dart';
import 'package:food/components/userDetailsComponents/phone.dart';

class UserScreen extends StatelessWidget {
  final String fullname;
  final String email;
  final String phone;

  const UserScreen(
      {super.key,
      required this.fullname,
      required this.email,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(2),
            child: Row(
              children: [
                Text(
                  'User Page',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(width: 30),
                Icon(Icons.person_3_rounded,
                    size: 50, color: Color.fromARGB(255, 66, 230, 145))
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 48, 83, 50),
        ),
        body: SingleChildScrollView(
            child: IntrinsicHeight(
                child: Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 188, 195, 189),
                          radius: 20,
                        ),
                        SizedBox(width: 40),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 182, 232, 189),
                          radius: 20,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Card(
                        color: Color.fromARGB(255, 114, 148, 115),
                        child: Padding(
                            padding: EdgeInsets.all(9.0),
                            child: Row(
                              children: [
                                Icon(Icons.bookmark,
                                    color: Colors.white, size: 30),
                                SizedBox(width: 20),
                                Text('User Details',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ))),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Card(
                          child: Padding(
                              padding: const EdgeInsets.all(9),
                              child: Column(
                                children: [
                                  Fullname(name: fullname),
                                  const Divider(
                                    height: 16,
                                    color: Color.fromARGB(255, 232, 227, 227),
                                  ),
                                  UserEmail(email: email),
                                  const Divider(
                                    height: 16,
                                    color: Color.fromARGB(255, 232, 227, 227),
                                  ),
                                  UserPhone(
                                    phone: phone,
                                  ),
                                  const Column(
                                    children: [
                                     
                                    
                                      Card(
                                        color: Color.fromARGB(255, 22, 78, 36),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                              SizedBox(width: 10),
                                              Text('Edit Details',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 78, 251, 81)))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ))));
  }
}
