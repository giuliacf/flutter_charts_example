import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  bool isFlChart = false;

  @action
  void changeTypeChart() => isFlChart = !isFlChart;
}
