import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instaknown/UI/Login/welcome.dart';
import 'package:instaknown/UI/Resources/Constants.dart' as R;

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _goToWelcomepage(BuildContext context) async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushNamedAndRemoveUntil(context, WelcomePage.id, (r) => false);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _goToWelcomepage(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue[900],
                  Colors.lightBlueAccent,
                  Colors.white,
                  // Color(
                  //   0xff6a60ee,
                  // ),
                  // Color(
                  //   0xff56edff,
                  // ),
                ],
                stops: [0, 0.5, 1],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 400,
              width: 400,
              // color: Colors.red,
              child: Image.asset('assets/Pune.gif'),
              // child: FlareActor(
              //   'assets/emoji1.flr',
              //   shouldClip: false,
              //   snapToEnd: true,
              //   sizeFromArtboard: true,
              //   alignment: Alignment.center,
              //   fit: BoxFit.contain,
              //   animation: "Animations",
              // ),
            ),
          ),
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
                  color: Colors.black,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
