import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_charts_example/screens/widgets/button_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../home_screen.dart';
import '../login_screen.dart';

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
          child: Container(
              width: 120,
              child: Image.asset(
                'assets/logo.png',
              )),
        ),
      ),
      actions: [
        ButtonAppBar(
          text: ' Trocar plugin',
          iconData: Icons.wifi_protected_setup_outlined,
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        ButtonAppBar(
          text: ' Sair',
          iconData: Icons.login,
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
