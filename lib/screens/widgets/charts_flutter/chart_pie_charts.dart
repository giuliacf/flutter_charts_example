import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ChartPieCharts extends StatelessWidget {
  Widget renderChart(bool hasDefaultRenderer) {
    return Container(
        height: 400.0,
        child: charts.PieChart(
          chartsData(),
          animate: false,
          defaultRenderer: hasDefaultRenderer
              ? charts.ArcRendererConfig(
            arcWidth: 60,
            arcRendererDecorators: [
              charts.ArcLabelDecorator(),
            ],
          )
              : null,
          behaviors: [
            charts.DatumLegend(
              position: charts.BehaviorPosition.end,
              horizontalFirst: false,
              cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
              showMeasures: true,
              legendDefaultMeasure: charts.LegendDefaultMeasure.lastValue,
              measureFormatter: (num value) {
                return value == null ? '-' : '${value}k';
              },
            ),
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
        children: [
          renderChart(true),
          renderChart(false),
        ],
      ),
    );
  }

  static List<charts.Series<LinearSales, int>> chartsData() {
    final data = [
      new LinearSales('Projeto 1', 100),
      new LinearSales('Projeto 2', 75),
      new LinearSales('Projeto 3', 25),
      new LinearSales('Projeto 4', 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.sales,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}

class LinearSales {
  final String year;
  final int sales;

  LinearSales(this.year, this.sales);
}
