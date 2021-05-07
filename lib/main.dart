import 'package:flutter/material.dart';
import 'package:flutter_charts_example/screens/home_screen.dart';
import 'package:flutter_charts_example/screens/login_screen.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Plataforma',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, widget),
              defaultScale: true,
              minWidth: 450,
              defaultName: MOBILE,
              breakpoints: [
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.resize(700, name: TABLET),
                ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ],
            ),
        // home: LoginScreen(),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
        });
  }
}
