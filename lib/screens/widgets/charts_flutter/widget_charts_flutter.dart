import 'package:flutter/material.dart';
import 'package:flutter_charts_example/screens/widgets/charts_flutter/chart_bar_charts.dart';
import 'package:flutter_charts_example/screens/widgets/charts_flutter/chart_line_charts.dart';
import 'package:flutter_charts_example/screens/widgets/charts_flutter/chart_pie_charts.dart';
import 'package:flutter_charts_example/screens/widgets/charts_flutter/widget_title_and_chart.dart';

class WidgetChartsFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          WidgetTitleAndChart(
            title: 'Tarefas concluídas no mês',
            chart: ChartBarCharts(),
          ),
          WidgetTitleAndChart(
            title: 'Tarefas existentes no projeto',
            chart: ChartLineCharts(),
          ),
          WidgetTitleAndChart(
            title: '% de horas trabalhadas no projeto (por funcionário)',
            chart: ChartPieCharts(),
          )
        ],
      ),
    );
  }
}
