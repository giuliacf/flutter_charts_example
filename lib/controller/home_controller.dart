import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

enum TypeChart {
  CHARTS_FLUTTER,
  FL_CHART,
}

abstract class _HomeController with Store {

  @observable
  bool isFlChart = false;

  @action
  void changeTypeChart() =>
      isFlChart = !isFlChart;

}
