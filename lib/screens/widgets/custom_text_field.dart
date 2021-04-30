import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Widget suffixIcon;

  CustomTextField({this.text, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintStyle: TextStyle(color: Colors.white),
          hintText: text,
          suffixIcon: suffixIcon),
    );
  }
}
