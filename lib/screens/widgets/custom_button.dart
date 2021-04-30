import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 24),
        backgroundColor: Color(0xFFF7941E),
      ),
    );
  }
}
