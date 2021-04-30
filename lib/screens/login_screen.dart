import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts_example/screens/home_screen.dart';
import 'package:flutter_charts_example/screens/widgets/custom_button.dart';
import 'package:flutter_charts_example/screens/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 400,
              child: Image.asset('assets/logo.png'),
            ),
            Expanded(child: CustomTextField(text: 'Login')),
            Expanded(child: CustomTextField(text: 'Senha')),
            SizedBox(
              height: 40,
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
        ));
  }
}
