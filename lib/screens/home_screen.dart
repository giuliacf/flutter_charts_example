import 'package:flutter/material.dart';
import 'package:flutter_charts_example/screens/widgets/responsive_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: ResponsiveAppBar(),
      ),
      body:Container()
    );
  }
}
