import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() onTap;

  const MyButton({key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.08,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 217, 255),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "Continue",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.09,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 217, 255),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
