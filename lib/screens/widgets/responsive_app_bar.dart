import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_charts_example/controller/home_controller.dart';
import 'package:flutter_charts_example/screens/widgets/button_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../login_screen.dart';

class ResponsiveAppBar extends StatelessWidget {
  final HomeController controller;

  ResponsiveAppBar({this.controller});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff40ba8d),
      elevation: 1,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 120,
            child: Image.asset(
              'assets/logo.png',
            ),
          )
        ],
      ),
      actions: [
        Observer(
          builder: (_) => ButtonAppBar(
              text: ' Trocar plugin',
              iconData: Icons.wifi_protected_setup_outlined,
              onTap: () => controller.changeTypeChart()),
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
