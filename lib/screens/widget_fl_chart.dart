import 'package:flutter/material.dart';
import 'package:flutter_charts_example/screens/widgets/fl_charts/fl_bar_%20chart.dart';
import 'package:flutter_charts_example/screens/widgets/fl_charts/fl_line_chart.dart';
import 'package:flutter_charts_example/screens/widgets/fl_charts/fl_pie_chart.dart';

class WidgetFlChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Container(
          padding: EdgeInsets.all(32),
          child: ListView(
            children: [
              FlBarCharts(),
              SizedBox(height: 16),
              FlLineCharts(),
              SizedBox(height: 16),
              FlPieCharts(),
            ],
          ),
        ),
      ),
    );
  }
}
