import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.text,
    this.onPressed,
    this.background
  });

  final String text;
  final Function onPressed;
  final Color background;

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
        backgroundColor: background,
      ),
    );
  }
}
