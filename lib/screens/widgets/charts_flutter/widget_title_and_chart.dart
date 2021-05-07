import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WidgetTitleAndChart extends StatelessWidget {
  final String title;
  final Widget chart;

  WidgetTitleAndChart({
    this.title,
    this.chart,
  });

  Widget containerChart(double marginHorizontal, double marginVertical) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal,
        vertical: marginVertical,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              chart,
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [Condition.largerThan(name: TABLET)],
      child: containerChart(100, 15),
      replacement: containerChart(0, 0)
    );
  }
}
