import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff40ba8d),
      elevation: 1,
      centerTitle: true,
      title: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: Container(width: 120, child: Image.asset('assets/logo.png')),
        ),
      ),
      actions: [
        MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.wifi_protected_setup_outlined),
                  Text(' Trocar plugin'),
                ],
              ),
            )),
        SizedBox(width: 20,),
        MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.login),
                  Text(' Sair'),
                ],
              ),
            )),
        SizedBox(width: 20,),
      ],
    );
  }
}
