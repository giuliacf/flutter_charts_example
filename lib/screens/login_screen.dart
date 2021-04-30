import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts_example/screens/home_screen.dart';
import 'package:flutter_charts_example/screens/widgets/custom_button.dart';
import 'package:flutter_charts_example/screens/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                child: Image.asset('assets/logo.png'),
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
    );
  }
}
