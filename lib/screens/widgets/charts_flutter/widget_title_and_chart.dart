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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
}
