import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final bool obscure;
  final Widget suffixIcon;
  final Function(String) onChanged;

  CustomTextField({
    this.text,
    this.obscure = false,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      obscureText: obscure,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintStyle: TextStyle(color: Colors.white),
        hintText: text,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
