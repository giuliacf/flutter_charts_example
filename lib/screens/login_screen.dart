import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts_example/controller/login_controller.dart';
import 'package:flutter_charts_example/screens/widgets/custom_button.dart';
import 'package:flutter_charts_example/screens/widgets/custom_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = LoginController();

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
                CustomTextField(
                  text: 'Login',
                  onChanged: controller.setUsername,
                ),
                SizedBox(
                  height: 16,
                ),
                Observer(
                  builder: (_) => CustomTextField(
                    text: 'Senha',
                    obscure: !controller.showPassword,
                    suffixIcon: IconButton(
                      tooltip: !controller.showPassword
                          ? 'Exibir senha'
                          : 'Ocultar senha',
                      icon: !controller.showPassword
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                      onPressed: controller.isVisiblePassword,
                    ),
                    onChanged: controller.setPassword,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Observer(
                  builder: (_) => controller.isLoading
                      ? CircularProgressIndicator()
                      : Container(
                          width: double.infinity,
                          child: CustomButton(
                            text: 'ENTRAR',
                            background: controller.canLogin
                                ? Color(0xFF40BA8D)
                                : Colors.grey[700],
                            onPressed: () => controller.canLogin
                                ? controller.login(context)
                                : null,
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
