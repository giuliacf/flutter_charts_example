import 'package:flutter/material.dart';
import 'package:flutter_charts_example/screens/widgets/fl_charts/fl_bar_chart.dart';
import 'package:flutter_charts_example/screens/widgets/fl_charts/fl_line_chart.dart';
import 'package:flutter_charts_example/screens/widgets/fl_charts/fl_pie_chart.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WidgetFlChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gráficos de barra',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 16),
                      VerticalBarChart(title: 'Tarefas concluídas por mês'),
                    ],
                  ),
                  SizedBox(height: 16),
                  buildColumnWidgets(
                    title: 'Gráficos de linha',
                    children: [
                      MultipleLineChart(title: 'Tarefas por tipo'),
                      MultipleLineChart(
                        title: 'Tarefas por tipo',
                        hasArea: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  buildColumnWidgets(
                    title: 'Gráficos torta',
                    children: [
                      PieChartExample(title: 'Tempo gasto por projeto'),
                      PieChartExample(
                        title: 'Tempo gasto por projeto',
                        hasCenterSpace: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Column buildColumnWidgets({String title, List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 16),
        ResponsiveVisibility(
          visible: false,
          visibleWhen: [Condition.largerThan(name: TABLET)],
          child: Row(
            children:
                children.map((widget) => Expanded(child: widget)).toList(),
          ),
          replacement: Wrap(
            runSpacing: 50,
            children: children,
          ),
        ),
      ],
    );
  }
}
