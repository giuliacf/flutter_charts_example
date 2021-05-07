import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  bool showPassword = false;

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @action
  void isVisiblePassword() => showPassword = !showPassword;

  @action
  void setUsername(String value) => username = value;

  @action
  void setPassword(String value) => password = value;

  void login(BuildContext context) {
    isLoading = true;

    Future.delayed(Duration(seconds: 5));

    Navigator.pushNamed(
      context,
      '/home',
    );

    isLoading = false;
  }

  @computed
  bool get canLogin => username.isNotEmpty && password.isNotEmpty;
}
