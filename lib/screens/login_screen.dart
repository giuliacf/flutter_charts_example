import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts_example/screens/home_screen.dart';
import 'package:flutter_charts_example/screens/widgets/custom_button.dart';
import 'package:flutter_charts_example/screens/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                CustomTextField(text: 'Login'),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(text: 'Senha'),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'ENTRAR',
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
