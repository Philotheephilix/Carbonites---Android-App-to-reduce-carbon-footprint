import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';
import '../widgets/common_top_bar.dart';
import '../widgets/custom_chart_widget.dart';

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
        children: [
          const CustomChartWidget(
            height: 190,
            chartType: 'line',
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _subWidgets(180, 200, 10),
              _subWidgets(180, 200, 10),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          _subWidgets(300, 300, 20),
        ],
      ),
    );
  }

  Container _subWidgets(double width, double height, double padding) {
    return Container(
      width: width,
      height: height,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
