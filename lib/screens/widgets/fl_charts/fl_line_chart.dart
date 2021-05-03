import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts_example/screens/widgets/fl_charts/indicator.dart';

class FlLineCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gráficos de linha',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            return GridView.count(
              crossAxisCount: constraints.maxWidth >= 700 ? 2 : 1,
              childAspectRatio: 1.5,
              crossAxisSpacing: 16,
              shrinkWrap: true,
              children: [
                MultipleLineChart(),
                MultipleLineChart(hasArea: true),
              ],
            );
          },
        ),
      ],
    );
  }
}

class MultipleLineChart extends StatefulWidget {
  final bool hasArea;

  MultipleLineChart({Key key, this.hasArea = false}) : super(key: key);

  @override
  _MultipleLineChartState createState() => _MultipleLineChartState();
}

class _MultipleLineChartState extends State<MultipleLineChart> {
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

  bool changeData = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tarefas por tipo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.shuffle),
                    iconSize: 18,
                    tooltip: 'Trocar dados',
                    onPressed: () {
                      setState(() {
                        changeData = !changeData;
                      });
                    },
                  ),
                ],
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
                    color: Color(0xff40ba8d),
                    text: 'Features',
                  ),
                  Indicator(
                    color: Color(0xffef4123),
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
                '',
                TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text: flSpot.y.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: flSpot.barIndex == 1 ? ' Bugs' : ' Features',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              );
            }).toList();
          },
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
      minX: 0,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: values[changeData ? 0 : 1]
          .asMap()
          .entries
          .map((value) => FlSpot(value.key.toDouble(), value.value.toDouble()))
          .toList(),
      isCurved: true,
      colors: [const Color(0xffef4123)],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: widget.hasArea,
        colors: [Color(0xffef4123).withOpacity(0.3)],
      ),
    );

    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: values[changeData ? 1 : 0]
          .asMap()
          .entries
          .map((value) => FlSpot(value.key.toDouble(), value.value.toDouble()))
          .toList(),
      isCurved: true,
      colors: [Color(0xff40ba8d)],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: widget.hasArea,
        colors: [Color(0xff40ba8d).withOpacity(0.3)],
      ),
    );

    return [
      lineChartBarData1,
      lineChartBarData2,
    ];
  }
}
