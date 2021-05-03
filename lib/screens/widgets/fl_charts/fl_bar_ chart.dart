import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FlBarCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        VerticalBarChart(),
      ],
    );
  }
}

class VerticalBarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VerticalBarChartState();
}

class VerticalBarChartState extends State<VerticalBarChart> {
  int touchedIndex;

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

  final values = <double>[12, 4, 6, 7, 12, 10, 13, 6, 4, 2, 8, 15];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 300,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tarefas concluídas no mês',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: BarChart(
                        mainBarData(
                          isMobile: constraints.maxWidth < 700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BarChartGroupData makeGroupData(int x, double y,
      {bool isMobile, bool isTouched = false}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          colors: isTouched ? [Color(0xff40ba8d)] : [Colors.white],
          width: isMobile ? 12 : 25,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 25,
            colors: [Colors.transparent],
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups(bool isMobile) => List.generate(
        12,
        (i) => makeGroupData(
          i,
          values[i],
          isMobile: isMobile,
          isTouched: i == touchedIndex,
        ),
      );

  BarChartData mainBarData({bool isMobile}) {
    return BarChartData(
      maxY: 20,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Theme.of(context).backgroundColor,
          getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
            months[group.x.toInt()] + ': ',
            TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            children: <TextSpan>[
              TextSpan(
                text: (rod.y - 1).toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! PointerUpEvent &&
                barTouchResponse.touchInput is! PointerExitEvent) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) {
            bool isTouched = touchedIndex == value.toInt();
            return TextStyle(
              color: isTouched ? Color(0xff40ba8d) : Colors.white,
              fontSize: 14,
            );
          },
          margin: 24,
          getTitles: (double value) => months[value.toInt()],
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 5,
          getTextStyles: (value) => TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          margin: 16,
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Colors.grey,
          strokeWidth: 0.3,
        ),
        horizontalInterval: 4,
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 0.3),
          top: BorderSide(color: Colors.white, width: 0.3),
        ),
      ),
      barGroups: showingGroups(isMobile),
    );
  }
}
