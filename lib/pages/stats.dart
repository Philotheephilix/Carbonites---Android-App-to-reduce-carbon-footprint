import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';
import '../widgets/common_top_bar.dart';
import '../widgets/custom_chart_widget_1.dart';
import '../models/percentage_circle.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffA1C4FD), Color(0xffC2E9FB)],
          ),
        ),
        child: ListView(
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
                _subWidgets(
                  180,
                  180,
                  10,
                  const PercentageCircle(
                    percentage: 95,
                    color: Colors.green,
                  ),
                ),
                _subWidgets(
                  180,
                  180,
                  10,
                  const PercentageCircle(
                    percentage: 87,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Report',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Capriola',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _subWidgets(
              300,
              300,
              20,
              const Text('hello'),
            ),
          ],
        ),
      ),
    );
  }

  Container _subWidgets(
      double width, double height, double padding, Widget element) {
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
          padding: const EdgeInsets.all(20),
          child: element,
        ),
      ),
    );
  }
}
