import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts_example/screens/widgets/fl_charts/indicator.dart';

const fetaureColor = Color(0xff40ba8d);
const bugsColor = Color(0xffef4123);

class MultipleLineChart extends StatelessWidget {
  final bool hasArea;
  final String title;

  MultipleLineChart({this.hasArea, this.title});

  final months = [
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez'
  ];

  final values = [
    [0, 2, 1, 3, 7, 1, 2, 2, 2, 3, 1, 1],
    [3, 5, 6, 6, 3, 7, 10, 9, 8, 10, 11, 14]
  ];

  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: LineChart(
                    lineData(context),
                    swapAnimationDuration: Duration(milliseconds: 500),
                    swapAnimationCurve: Curves.easeInOut,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Indicator(
                    color: fetaureColor,
                    text: 'Features',
                  ),
                  Indicator(
                    color: bugsColor,
                    text: 'Bugs',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  LineChartData lineData(BuildContext context) {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Theme.of(context).backgroundColor,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;

              return LineTooltipItem(
                flSpot.y.toString(),
                TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: flSpot.barIndex == 1 ? ' Bugs' : ' Features'),
                ],
              );
            }).toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: true,
        horizontalInterval: 4,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: (value) => months[value.toInt()],
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          margin: 24,
          rotateAngle: -45,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          interval: 5,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 0.3),
          top: BorderSide(color: Colors.white, width: 0.3),
        ),
      ),
      maxY: 20,
      maxX: 11,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: values[0]
          .asMap()
          .entries
          .map((model) => FlSpot(model.key.toDouble(), model.value.toDouble()))
          .toList(),
      isCurved: true,
      colors: [bugsColor],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: hasArea,
        colors: [bugsColor.withOpacity(0.3)],
      ),
    );

    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: values[1]
          .asMap()
          .entries
          .map((model) => FlSpot(model.key.toDouble(), model.value.toDouble()))
          .toList(),
      isCurved: true,
      colors: [fetaureColor],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: hasArea,
        colors: [fetaureColor.withOpacity(0.3)],
      ),
    );

    return [
      lineChartBarData1,
      lineChartBarData2,
    ];
  }
}
