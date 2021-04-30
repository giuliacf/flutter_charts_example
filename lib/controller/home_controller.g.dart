// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$currentChartAtom = Atom(name: '_HomeController.currentChart');

  @override
  Widget get currentChart {
    _$currentChartAtom.reportRead();
    return super.currentChart;
  }

  @override
  set currentChart(Widget value) {
    _$currentChartAtom.reportWrite(value, super.currentChart, () {
      super.currentChart = value;
    });
  }

  final _$isFlChartAtom = Atom(name: '_HomeController.isFlChart');

  @override
  bool get isFlChart {
    _$isFlChartAtom.reportRead();
    return super.isFlChart;
  }

  @override
  set isFlChart(bool value) {
    _$isFlChartAtom.reportWrite(value, super.isFlChart, () {
      super.isFlChart = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  void changeTypeChart() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.changeTypeChart');
    try {
      return super.changeTypeChart();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentChart: ${currentChart},
isFlChart: ${isFlChart}
    ''';
  }
}
