import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyTextField({
      key,
     this.controller,
     this.hintText,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val.isEmpty ? 'Please enter your Email-ID' : null,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}

class MyPasswordTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyPasswordTextField({
    key,
    this.controller,
    this.hintText,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val.isEmpty ? 'Please enter your Password' : null,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.visibility_off),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}
