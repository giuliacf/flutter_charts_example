import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts_example/controller/home_controller.dart';
import 'package:flutter_charts_example/screens/widget_charts_flutter.dart';
import 'package:flutter_charts_example/screens/widget_fl_chart.dart';
import 'package:flutter_charts_example/screens/widgets/responsive_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget {

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: ResponsiveAppBar(controller: controller),
      ),
      body: Observer(
        builder: (_) => controller.isFlChart?
        WidgetFlChart() : WidgetChartsFlutter(),
      )
    );
  }
}
