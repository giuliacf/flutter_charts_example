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
              showMeasures: false,
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

  static List<charts.Series<HoursForProject, String>> chartsData() {
    final data = [
      HoursForProject(
        'Projeto 1',
        50,
        charts.ColorUtil.fromDartColor(
          Color(0xff40BA8D),
        ),
      ),
      HoursForProject(
        'Projeto 2',
        25,
        charts.ColorUtil.fromDartColor(
          Color(0xffF7941E),
        ),
      ),
      HoursForProject(
        'Projeto 3',
        10,
        charts.ColorUtil.fromDartColor(
          Color(0xffEF4123),
        ),
      ),
      HoursForProject(
        'Projeto 4',
        15,
        charts.ColorUtil.fromDartColor(
          Color(0xff0C3455),
        ),
      ),
    ];

    return [
      charts.Series<HoursForProject, String>(
        id: 'percentage',
        domainFn: (HoursForProject percentage, _) => percentage.project,
        measureFn: (HoursForProject percentage, _) => percentage.percentage,
        data: data,
        labelAccessorFn: (HoursForProject row, _) => '${row.project}',
        colorFn: (HoursForProject color, _) => color.color,
      )
    ];
  }
}

class HoursForProject {
  final String project;
  final int percentage;
  final charts.Color color;

  HoursForProject(
    this.project,
    this.percentage,
    this.color,
  );
}
