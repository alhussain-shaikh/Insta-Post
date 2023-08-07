import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatefulWidget {
  final Function() onTap;

  const MyButton({key, this.onTap});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    List<Color> isdark = [
      Color.fromARGB(255, 0, 0, 0),
      Color.fromARGB(255, 102, 104, 105),
    ];
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.07,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(4, 4)),
              BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(-3, -3))
            ],
            gradient: LinearGradient(
                colors: isdark,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 0.9])),
        child: const Center(
          child: Text(
            "Next",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class MyButtonAgree extends StatelessWidget {
  final Function() onTap;
  final String text;
  const MyButtonAgree({key, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    List<Color> isdark = [
      Color.fromARGB(255, 0, 0, 0),
      Color.fromARGB(255, 102, 104, 105),
    ];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.075,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(4, 4)),
              BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(-3, -3))
            ],
            gradient: LinearGradient(
                colors: isdark,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 0.9])),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
      ),
    );
  }
}
