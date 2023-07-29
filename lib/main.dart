import 'package:flutter/material.dart';
import 'package:instaknown/UI/Login/login.dart';
import 'package:instaknown/UI/Login/welcome.dart';
import 'package:instaknown/UI/Pages/AboutPage.dart';
import 'package:instaknown/UI/Pages/HomePage.dart';
import 'package:instaknown/UI/Pages/SplashScreen.dart';
import 'package:instaknown/locator.dart';

void main() {
  setupLocator();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomePage.id: (context) => HomePage(),
        SplashScreen.id: (context) => SplashScreen(),
        AboutPage.id: (context) => AboutPage(),
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context)=> LoginPage()
      },
      // initialRoute: SplashScreen.id,
      home: SplashScreen(),
    );
  }
}
