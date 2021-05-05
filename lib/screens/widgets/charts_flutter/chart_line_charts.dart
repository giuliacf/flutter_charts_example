import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ChartLineCharts extends StatelessWidget {
  Widget renderChart(bool isVertical) {
    return Container(
      height: 400.0,
      child: charts.LineChart(_createSampleData(),
          defaultRenderer: new charts.LineRendererConfig(
            includeArea: isVertical,
            stacked: true,
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

  static List<charts.Series<ProjectTasks, int>> _createSampleData() {
    final myFakeDesktopData = [
      ProjectTasks(
        0,
        5,
        charts.ColorUtil.fromDartColor(
          Color(0xffEF4123),
        ),
      ),
      ProjectTasks(
        1,
        25,
        charts.ColorUtil.fromDartColor(
          Color(0xffEF4123),
        ),
      ),
      ProjectTasks(
        2,
        100,
        charts.ColorUtil.fromDartColor(
          Color(0xffEF4123),
        ),
      ),
      ProjectTasks(
        3,
        75,
        charts.ColorUtil.fromDartColor(
          Color(0xffEF4123),
        ),
      ),
    ];

    var myFakeTabletData = [
      ProjectTasks(
        0,
        10,
        charts.ColorUtil.fromDartColor(
          Color(0xffF7941E),
        ),
      ),
      ProjectTasks(
        1,
        50,
        charts.ColorUtil.fromDartColor(
          Color(0xffF7941E),
        ),
      ),
      ProjectTasks(
        2,
        200,
        charts.ColorUtil.fromDartColor(
          Color(0xffF7941E),
        ),
      ),
      ProjectTasks(
        3,
        150,
        charts.ColorUtil.fromDartColor(
          Color(0xffF7941E),
        ),
      ),
    ];

    var myFakeMobileData = [
      ProjectTasks(
        0,
        15,
        charts.ColorUtil.fromDartColor(
          Color(0xff40BA8D),
        ),
      ),
      ProjectTasks(
        1,
        75,
        charts.ColorUtil.fromDartColor(
          Color(0xff40BA8D),
        ),
      ),
      ProjectTasks(
        2,
        300,
        charts.ColorUtil.fromDartColor(
          Color(0xff40BA8D),
        ),
      ),
      ProjectTasks(
        3,
        225,
        charts.ColorUtil.fromDartColor(
          Color(0xff40BA8D),
        ),
      ),
    ];

    return [
      new charts.Series<ProjectTasks, int>(
        id: 'Bugs',
        colorFn: (ProjectTasks color, _) => color.color,
        domainFn: (ProjectTasks sales, _) => sales.year,
        measureFn: (ProjectTasks sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
      new charts.Series<ProjectTasks, int>(
        id: 'Testes',
        colorFn: (ProjectTasks color, _) => color.color,
        domainFn: (ProjectTasks sales, _) => sales.year,
        measureFn: (ProjectTasks sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
      new charts.Series<ProjectTasks, int>(
        id: 'Melhorias',
        colorFn: (ProjectTasks color, _) => color.color,
        domainFn: (ProjectTasks sales, _) => sales.year,
        measureFn: (ProjectTasks sales, _) => sales.sales,
        data: myFakeMobileData,
      ),
    ];
  }
}

class ProjectTasks {
  final int year;
  final int sales;
  final charts.Color color;

  ProjectTasks(
    this.year,
    this.sales,
    this.color,
  );
}
