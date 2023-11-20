import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/widgets/menu_drawer.dart';

import '../widgets/common_top_bar.dart';
import '../models/chart_widgets.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonTopBar(
        backgroundcolor: Color(0xffBCCFFF),
      ),
      drawer: const MenuDrawer(
        drawerColor: Color(0xffBCCFFF),
      ),
      body: ListView(
        children: const [
          LineChartWidget(),
          SizedBox(
            height: 5.0,
          ),
          ColumnChartWidget(),
          SizedBox(
            height: 5.0,
          ),
          BarChartWidget(),
          SizedBox(
            height: 5.0,
          ),
          PieChartWidget(),
          SizedBox(
            height: 5.0,
          ),
          DoughnutChartWidget(),
        ],
      ),
    );
  }
}