import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ChartBarCharts extends StatelessWidget {
  Widget renderChart(bool isVertical) {
    return Container(
        height: 400.0,
        child: charts.BarChart(
          chartsData(),
          animate: false,
          vertical: isVertical,
          behaviors: [
            charts.SeriesLegend(
              position: charts.BehaviorPosition.bottom,
              desiredMaxRows: 2,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [Condition.largerThan(name: TABLET)],
      child: Row(
        children: [
          Expanded(
            child: renderChart(true),
          ),
          Expanded(
            child: renderChart(false),
          ),
        ],
      ),
      replacement: Wrap(
        runSpacing: 50,
        children: [renderChart(true), renderChart(false)],
      ),
    );
  }

  static List<charts.Series<DoneTasks, String>> chartsData() {
    final january = [
      new DoneTasks('Jan', 55),
    ];

    final february = [
      new DoneTasks('Fev', 20),
    ];

    final march = [
      new DoneTasks('Mar', 45),
    ];

    final april = [
      new DoneTasks('Abr', 30),
    ];

    final may = [
      new DoneTasks('Mai', 10),
    ];

    return [
      new charts.Series<DoneTasks, String>(
        id: 'Janeiro',
        domainFn: (DoneTasks sales, _) => sales.month,
        measureFn: (DoneTasks sales, _) => sales.sales,
        data: january,
      ),
      new charts.Series<DoneTasks, String>(
        id: 'Fevereiro',
        domainFn: (DoneTasks sales, _) => sales.month,
        measureFn: (DoneTasks sales, _) => sales.sales,
        data: february,
      ),
      new charts.Series<DoneTasks, String>(
        id: 'Março',
        domainFn: (DoneTasks sales, _) => sales.month,
        measureFn: (DoneTasks sales, _) => sales.sales,
        data: march,
      ),
      new charts.Series<DoneTasks, String>(
        id: 'Abril',
        domainFn: (DoneTasks sales, _) => sales.month,
        measureFn: (DoneTasks sales, _) => sales.sales,
        data: april,
      ),
      new charts.Series<DoneTasks, String>(
        id: 'Maio',
        domainFn: (DoneTasks sales, _) => sales.month,
        measureFn: (DoneTasks sales, _) => sales.sales,
        data: may,
      ),
    ];
  }
}

class DoneTasks {
  final String month;
  final int sales;

  DoneTasks(this.month, this.sales);
}
