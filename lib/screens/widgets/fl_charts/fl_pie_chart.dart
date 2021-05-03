import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_charts_example/screens/widgets/indicator.dart';

class PieModel {
  final Color color;
  final String text;
  final double value;

  PieModel({this.color, this.text, this.value});
}

class FlPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gráficos de torta',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 16),
        PieChartSample2(hasCenterSpace: true),
        PieChartSample2(),
      ],
    );
  }
}

class PieChartSample2 extends StatefulWidget {
  final bool hasCenterSpace;

  const PieChartSample2({Key key, this.hasCenterSpace = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex;

  List<PieModel> data = [
    PieModel(color: Color(0xff40ba8d), text: 'Projeto 1', value: 40),
    PieModel(color: Color(0xffF7941E), text: 'Projeto 2', value: 30),
    PieModel(color: Color(0xffEF4123), text: 'Projeto 3', value: 15),
    PieModel(color: Color(0xff0C3455), text: 'Projeto 4', value: 15)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tarefas por tipo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: PieChart(
                  PieChartData(
                    pieTouchData:
                        PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        final desiredTouch =
                            pieTouchResponse.touchInput is! PointerExitEvent &&
                                pieTouchResponse.touchInput is! PointerUpEvent;
                        if (desiredTouch &&
                            pieTouchResponse.touchedSection != null) {
                          touchedIndex = pieTouchResponse
                              .touchedSection.touchedSectionIndex;
                        } else {
                          touchedIndex = -1;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: widget.hasCenterSpace ? 40 : 0,
                    sections: showingSections(widget.hasCenterSpace),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...data.map((model) {
                    return Indicator(
                      color: model.color,
                      text: model.text,
                    );
                  }).toList(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(bool hasCenterSpace) {
    return data.asMap().entries.map((model) {
      final isTouched = model.key == touchedIndex;
      final double fontSize = 14;
      final double radius =
          isTouched ? (hasCenterSpace ? 60 : 110) : (hasCenterSpace ? 50 : 100);

      return PieChartSectionData(
        color: model.value.color,
        value: model.value.value,
        title: '${model.value.value}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
}
