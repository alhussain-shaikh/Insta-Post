// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:instaknown/UI/Login/auth_controller.dart';
import 'package:instaknown/UI/Login/components/my_button.dart';
import 'package:instaknown/UI/Login/components/my_textfield.dart';
import 'package:instaknown/UI/Login/welcome.dart';
import 'package:flutter/material.dart';
import 'package:instaknown/UI/Pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  static const id = 'Login Page';
  var email;
  LoginPage({Key key, this.email});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var passwordController = TextEditingController();

  final double _sigmaX = 5;

  // from 0-10
  final double _sigmaY = 5;

  // from 0-10
  final double _opacity = 0.2;

  final _formKey = GlobalKey<FormState>();

  // Login user in method
  AuthController _authHelper = AuthController();

  void loginIn() {
    if (_formKey.currentState.validate()) {
      _authHelper
          .login(widget.email, passwordController.text)
          .then<void>((value) => {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return HomePage();
                }))
              });
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    // text editing controllers

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
                        image: AssetImage("assets/PP2.jpg"),
                        fit: BoxFit.cover)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () =>
                            Navigator.pushNamed(context, WelcomePage.id),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/Pune.gif"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.28),
                  const Text("Log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),

                  ClipRect(
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(_opacity),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(children: [
                                    const CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          'https://images.unsplash.com/photo-1615482317155-9d26e2574de2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aW5kaWFuJTIwcG9saWNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text("Pune Police",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 5),
                                        Text(widget.email,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16))
                                      ],
                                    )
                                  ]),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                MyTextField(
                                  controller: passwordController,
                                  hintText: 'Password',
                                  obscureText: true,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                MyButtonAgree(text: "Login", onTap: loginIn
                                    //  () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => HomePage()));
                                    // AuthController.instance
                                    //     .login(widget.email, passwordController.text);
                                    // },
                                    ),
                                const SizedBox(height: 15),
                                const Text('Forgot Password?',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 217, 255),
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    textAlign: TextAlign.start),
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
