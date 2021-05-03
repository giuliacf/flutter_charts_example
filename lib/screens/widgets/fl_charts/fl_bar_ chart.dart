import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlBarChart extends StatelessWidget {
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

const months = [
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

const values = <double>[12, 4, 6, 7, 12, 10, 13, 6, 4, 2, 8, 15];

class VerticalBarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VerticalBarChartState();
}

class VerticalBarChartState extends State<VerticalBarChart> {
  int touchedIndex;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
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
              Expanded(child: BarChart(mainBarData())),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          colors: [Colors.white],
          width: 25,
          borderRadius: BorderRadius.all(Radius.zero),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 25,
            colors: [Colors.transparent],
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(
        12,
        (i) => makeGroupData(
          i,
          values[i],
        ),
      );

  BarChartData mainBarData() {
    return BarChartData(
      maxY: 20,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Theme.of(context).backgroundColor,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay = months[group.x.toInt()];

            return BarTooltipItem(
              weekDay + ': ',
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
            );
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
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
      barGroups: showingGroups(),
    );
  }
}
