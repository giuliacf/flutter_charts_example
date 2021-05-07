import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ChartLineCharts extends StatelessWidget {

  Widget renderChart(bool isVertical) {

    return Container(
      height: 400.0,
      child: charts.LineChart(_createSampleData(),
          defaultRenderer: charts.LineRendererConfig(
            includeArea: isVertical,
            stacked: true,
          ),

          domainAxis: charts.AxisSpec<num>(
            renderSpec: charts.SmallTickRendererSpec(
              labelStyle: charts.TextStyleSpec(
                  color: charts.ColorUtil.fromDartColor(Colors.white)),
            ),

          ),
          primaryMeasureAxis: charts.NumericAxisSpec(
            renderSpec: charts.SmallTickRendererSpec(
              labelStyle: charts.TextStyleSpec(
                  color: charts.ColorUtil.fromDartColor(Colors.white)),
            ),
          ),
          behaviors: [
            charts.SeriesLegend(
              position: charts.BehaviorPosition.bottom,
              desiredMaxRows: 2,
            )
          ],
          animate: true),
    );
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
        children: [
          renderChart(true),
          renderChart(false),
        ],
      ),
    );
  }

  static List<charts.Series<TypeTasks, int>> _createSampleData() {
    final bugTasks = [
      TypeTasks(0, 50),
      TypeTasks(1, 25),
      TypeTasks(2, 100),
      TypeTasks(3, 75),
      TypeTasks(4, 125),
    ];

    var improvementTasks = [
      TypeTasks(0, 10),
      TypeTasks(1, 50),
      TypeTasks(2, 200),
      TypeTasks(3, 150),
      TypeTasks(4, 15),
    ];

    var implementationTasks = [
      TypeTasks(0, 15),
      TypeTasks(1, 300),
      TypeTasks(2, 75),
      TypeTasks(3, 225),
      TypeTasks(4, 225),
    ];

    return [
      charts.Series<TypeTasks, int>(
        id: 'Bugs',
        colorFn: (_, __) => charts.Color.fromHex(code: '#EF4123'),
        domainFn: (TypeTasks quantity, _) => quantity.month,
        measureFn: (TypeTasks quantity, _) => quantity.quantity,
        data: bugTasks,
      ),
      charts.Series<TypeTasks, int>(
        id: 'Melhorias',
        colorFn: (_, __) => charts.Color.fromHex(code: '#F7941E'),
        domainFn: (TypeTasks quantity, _) => quantity.month,
        measureFn: (TypeTasks quantity, _) => quantity.quantity,
        data: improvementTasks,
      ),
      charts.Series<TypeTasks, int>(
        id: 'Implementações',
        colorFn: (_, __) => charts.Color.fromHex(code: '#8dc63f'),
        domainFn: (TypeTasks quantity, _) => quantity.month,
        measureFn: (TypeTasks quantity, _) => quantity.quantity,
        data: implementationTasks,
      ),
    ];
  }
}

class TypeTasks {
  final int month;
  final int quantity;

  TypeTasks(this.month, this.quantity);
}
