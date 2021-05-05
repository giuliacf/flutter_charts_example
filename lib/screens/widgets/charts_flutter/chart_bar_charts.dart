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
          animate: true,
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
          Container(
            width: 150,
            child: VerticalDivider(),
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
      DoneTasks('Jan', 55, charts.Color.fromHex(code: '#EF4123')),
    ];

    final february = [
      DoneTasks(
        'Fev',
        20,
        charts.Color.fromHex(code: '#0C3455'),
      ),
    ];

    final march = [
      DoneTasks(
        'Mar',
        45,
        charts.Color.fromHex(code: '#F7941E'),
      ),
    ];

    final april = [
      DoneTasks(
        'Abr',
        30,
        charts.Color.fromHex(code: '#8dc63f'),
      ),
    ];

    final may = [
      DoneTasks(
        'Mai',
        10,
        charts.Color.fromHex(code: '#40BA8D'),
      ),
    ];

    return [
      charts.Series<DoneTasks, String>(
        id: 'Janeiro',
        domainFn: (DoneTasks number, _) => number.month,
        measureFn: (DoneTasks number, _) => number.number,
        data: january,
        colorFn: (DoneTasks color, _) => color.color,
      ),
      charts.Series<DoneTasks, String>(
        id: 'Fevereiro',
        domainFn: (DoneTasks number, _) => number.month,
        measureFn: (DoneTasks number, _) => number.number,
        data: february,
        colorFn: (DoneTasks color, _) => color.color,
      ),
      charts.Series<DoneTasks, String>(
        id: 'Março',
        domainFn: (DoneTasks number, _) => number.month,
        measureFn: (DoneTasks number, _) => number.number,
        data: march,
        colorFn: (DoneTasks color, _) => color.color,
      ),
      charts.Series<DoneTasks, String>(
        id: 'Abril',
        domainFn: (DoneTasks number, _) => number.month,
        measureFn: (DoneTasks number, _) => number.number,
        data: april,
        colorFn: (DoneTasks color, _) => color.color,
      ),
      charts.Series<DoneTasks, String>(
        id: 'Maio',
        domainFn: (DoneTasks number, _) => number.month,
        measureFn: (DoneTasks number, _) => number.number,
        data: may,
        colorFn: (DoneTasks color, _) => color.color,
      ),
    ];
  }
}

class DoneTasks {
  final String month;
  final int number;
  final Color color;

  DoneTasks(this.month, this.number, this.color);
}
