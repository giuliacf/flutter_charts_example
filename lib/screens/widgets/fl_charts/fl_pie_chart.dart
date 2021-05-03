import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_charts_example/screens/widgets/fl_charts/indicator.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PieModel {
  final Color color;
  final String text;
  final double value;

  PieModel({this.color, this.text, this.value});
}

class FlPieCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gráficos torta',
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
                PieChartExample(hasCenterSpace: true),
                PieChartExample(),
              ],
            );
          },
        )
      ],
    );
  }
}

class PieChartExample extends StatefulWidget {
  final bool hasCenterSpace;
  PieChartExample({this.hasCenterSpace = false});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartExample> {
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tempo gasto por projeto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: PieChart(
                        PieChartData(
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              final desiredTouch = pieTouchResponse.touchInput
                                      is! PointerExitEvent &&
                                  pieTouchResponse.touchInput
                                      is! PointerUpEvent;
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
                    ResponsiveVisibility(
                      visible: false,
                      visibleWhen: [
                        Condition.smallerThan(name: TABLET),
                        Condition.equals(name: TABLET)
                      ],
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ...data.map((model) {
                            return Indicator(
                              color: model.color,
                              text: model.text,
                              verticalSpace: 4,
                            );
                          }).toList(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ResponsiveVisibility(
                visible: false,
                visibleWhen: [Condition.largerThan(name: TABLET)],
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...data.map((model) {
                      return Indicator(
                        color: model.color,
                        text: model.text,
                        horizontalSpace: 8,
                      );
                    }).toList(),
                  ],
                ),
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
      final double radius =
          isTouched ? (hasCenterSpace ? 50 : 100) : (hasCenterSpace ? 40 : 90);

      return PieChartSectionData(
        color: model.value.color,
        value: model.value.value,
        title: '${model.value.value}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
}
