import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food/components/apiComponents/api.dart';
import 'package:food/components/divider.dart';
import 'package:food/components/myLabel.dart';
import 'package:food/components/my_textfield.dart';
import 'package:food/screens/authentications.dart';
import 'package:food/screens/user.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(7),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'User Registration',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(width: 30),
                Icon(Icons.cloud_circle_rounded,
                    size: 50, color: Color.fromARGB(255, 203, 227, 64))
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 48, 83, 50),
        ),
        body: SingleChildScrollView(
            child: IntrinsicHeight(
                child: SafeArea(
                    child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 4),
                Card(
                  color: Color.fromARGB(255, 215, 221, 215),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      //logo
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Color.fromARGB(255, 31, 94, 62),
                        child: Icon(
                          Icons.lock_reset_rounded,
                          size: 80,
                          color: Color.fromARGB(255, 235, 195, 75),
                        ),
                      ),

                      const SizedBox(
                        height: 40,
                      ),

                      //welcome what you have been doing

                      //username TextField

                      MyTextField(
                        controller: nameController,
                        hintText: 'Fullname',
                        obscureText: false,
                      ),

                      MyTextField(
                        controller: usernameController,
                        hintText: 'Email (ashley@yahoo.com)',
                        obscureText: false,
                      ),

                      MyTextField(
                        controller: phoneController,
                        hintText: 'Phone',
                        obscureText: false,
                      ),

                      //password textField
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      //signin button

                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: GestureDetector(
                          onTap: () async {
                            final data = {
                              'name': nameController.text.toString(),
                              'email': usernameController.text.toString(),
                              'phone': phoneController.text.toString(),
                              'password': passwordController.text.toString(),
                              'password2':passwordController.text.toString()
                              
                            };
                            var result = await CallApi().registerUser(data: data);

                            if(result==200){
                               // ignore: use_build_context_synchronously
                               Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Authentication()),
                                  );
                            }
                            
                          },
                          child: Container(
                              padding: const EdgeInsets.all(9),
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 68, 85, 47),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('SIGN UP',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 8),
                                  Icon(Icons.star_border_sharp,
                                      size: 40, color: Colors.amber)
                                ],
                              )),
                        ),
                      ),

                      // const MyDivider(),

                      // Padding(
                      //     padding: const EdgeInsets.all(9),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           const Text('Not Registered?',
                      //               style: TextStyle(
                      //                   fontSize: 23,
                      //                   color:
                      //                       Color.fromARGB(255, 31, 79, 53))),
                      //           Expanded(
                      //               child: Container(
                      //                   padding: EdgeInsets.all(9),
                      //                   margin:
                      //                       EdgeInsets.symmetric(horizontal: 9),
                      //                   decoration: BoxDecoration(
                      //                       color: Color.fromARGB(
                      //                           255, 69, 112, 105),
                      //                       borderRadius:
                      //                           BorderRadius.circular(8)),
                      //                   child: const Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.center,
                      //                     children: [
                      //                       Expanded(
                      //                         child: Text('SIGN UP',
                      //                             style: TextStyle(
                      //                                 color: Color.fromARGB(
                      //                                     255, 233, 238, 233),
                      //                                 fontSize: 25,
                      //                                 fontWeight:
                      //                                     FontWeight.bold)),
                      //                       ),
                      //                       SizedBox(width: 8),
                      //                       // Icon(Icons.subdirectory_arrow_left_outlined,
                      //                       //     size: 40)
                      //                     ],
                      //                   ))),
                      //         ])),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )))));
  }
}
