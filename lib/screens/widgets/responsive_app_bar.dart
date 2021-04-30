import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff40ba8d),
      elevation: 1,
      title: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 40,
                child: Image.asset('assets/logo.png')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
