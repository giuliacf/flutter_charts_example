import 'package:flutter/material.dart';

class WidgetTitleAndChart extends StatelessWidget {
  final String title;
  final Widget chart;

  WidgetTitleAndChart({
    this.title,
    this.chart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
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
    );
  }
}
