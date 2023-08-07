// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:ui';
import 'package:instaknown/UI/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:instaknown/UI/Login/components/my_button.dart';
import 'package:instaknown/UI/Login/components/my_textfield.dart';
import 'package:instaknown/UI/Resources/Constants.dart' as R;

class WelcomePage extends StatefulWidget {
  WelcomePage({key});
  static const id = 'Welcome Page';
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // text editing controllers
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  double _sigmaX = 5;
  // from 0-10
  double _sigmaY = 5;
  // from 0-10
  double _opacity = 0.2;

  final _formKey = GlobalKey<FormState>();
  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/white.jpg"),
                        fit: BoxFit.cover)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IconButton(
                      //   icon: const Icon(Icons.arrow_back_ios),
                      //   color: Colors.white,
                      //   onPressed: () {},
                      // ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.5,
                      // ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: MediaQuery.of(context).size.height * 0.26,
                        decoration: const BoxDecoration(
                            // color: Colors.amber,
                            image: DecorationImage(
                                image: AssetImage("assets/Pune.gif"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 100.0 + MediaQuery.of(context).size.height / 2,
                    child: Hero(
                      tag: 'appName',
                      child: Text(
                        'InstaAnalysis',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: R.instagramFontFamily,
                          color: Color.fromARGB(255, 0, 0, 0),
                          letterSpacing: 3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0)
                                .withOpacity(_opacity),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Login Credentials",
                                    style: TextStyle(
                                      color: Colors.black,
                                      // fontFamily: R.instagramFontFamily,
                                      fontSize: 23,
                                    )),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                // username textfield
                                MyTextField(
                                  controller: usernameController,
                                  hintText: 'Officer Id',
                                  icons: Icons.person_2_outlined,
                                  obscureText: false,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                MyTextField(
                                  controller: emailController,
                                  hintText: 'Email',
                                  icons: Icons.email_outlined,
                                  obscureText: false,
                                ),

                                const SizedBox(height: 20),

                                // sign in button
                                MyButton(
                                  onTap: (() {
                                    if (_formKey.currentState.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LoginPage(
                                                    email: emailController.text
                                                        .toString(),
                                                    username: usernameController
                                                        .text
                                                        .toString(),
                                                  )));
                                    } else {
                                      print('not valid');
                                    }
                                  }),
                                ),

                                const SizedBox(height: 10),

                                // or continue with
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
