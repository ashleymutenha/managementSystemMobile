import 'package:flutter/material.dart';
import 'package:food/components/apiComponents/api.dart';
import 'package:food/components/divider.dart';
import 'package:food/components/myLabel.dart';
import 'package:food/components/my_textfield.dart';
import 'package:food/screens/registration.dart';
import 'package:food/screens/user.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => AuthenticationState();
}

class AuthenticationState extends State<Authentication> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String name = "name";
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
                    'Management System',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Icon(Icons.cloud_circle_rounded,
                      size: 50, color: Color.fromARGB(255, 203, 227, 64)),
                )
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
                const SizedBox(height:4),
                Card(
                  color: Color.fromARGB(255, 215, 221, 215),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      //logo
                      const CircleAvatar(radius: 50,backgroundColor:Color.fromARGB(255, 31, 94, 62) ,child:Icon(
                        Icons.lock_reset_rounded,
                        size: 80,
                        color:Color.fromARGB(255, 235, 195, 75),
                      ),),
                
                      const SizedBox(
                        height: 40,
                      ),
                
                      //welcome what you have been doing
                
                      //username TextField
                
                      MyTextField(
                        controller: usernameController,
                        hintText: 'Username',
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
                           
                        
                            var members = await CallApi().getMembers();
                            if (members != null) {
                              for (int i = 0; i < members.length; i++) {
                                if (members[i].email == usernameController.text &&
                                    members[i].password == passwordController.text) {
                                  setState(() {
                                    name = members[i].name;
                                  });
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserScreen(
                                              email: members[i].email,
                                              fullname: members[i].name,
                                              phone: members[i].phone,
                                            )),
                                  );
                                }
                              }
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
                                  Text('SIGN IN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 8),
                                  Icon(Icons.check_box_rounded, size: 40,color:Colors.amber)
                                ],
                              )),
                        ),
                      ),
                
                    
                
                      const MyDivider(),
                
                      GestureDetector(
                        onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Registration()),
                                  );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Not Registered?',
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Color.fromARGB(255, 31, 79, 53))),
                                Expanded(child:Container(
                                    padding: EdgeInsets.all(9),
                                    margin: EdgeInsets.symmetric(horizontal: 9),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 69, 112, 105),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text('SIGN UP',
                                              style: TextStyle(
                                                  color:
                                                      Color.fromARGB(255, 233, 238, 233),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(width: 8),
                                        // Icon(Icons.subdirectory_arrow_left_outlined,
                                        //     size: 40)
                                      ],
                                    ))),
                              ])),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        )))));
  }
}
