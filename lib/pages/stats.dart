// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/widgets/report_widget.dart';

import '../models/menu_drawer.dart';
import '../widgets/common_top_bar.dart';
import '../widgets/custom_chart_widget_1.dart';
import '../models/percentage_circle.dart';

import 'package:pi_carbon_tracer/widgets/chart_widgets_1.dart';

Future<double> value = storeperc();

class StatsPage extends StatefulWidget {
  const StatsPage({
    Key? key,
  }) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  late double value;
  late double piPoints = 0;
  late double direct = 0;
  late double indirect = 0;
  late Map<String, double> categoryTotalAmounts = {};
  @override
  void initState() {
    super.initState();
    _fetchValueAndCalculate();
  }

  Future<void> _fetchValueAndCalculate() async {
    try {
      double fetchedValue = await storeperc();
      categoryTotalAmounts = await getCCategorySum() as Map<String, double>;

      setState(() {
        value = fetchedValue.toDouble();
        piPoints = calculateLowPercentage(value, 16000).toInt().toDouble();
        direct = calculateLowPercentage(
            categoryTotalAmounts['Travel']! + categoryTotalAmounts['Food']!,
            7000);
        indirect = calculateLowPercentage(
            categoryTotalAmounts['Travel']! +
                categoryTotalAmounts['Food']! +
                categoryTotalAmounts['Goods']! +
                categoryTotalAmounts['Service']! +
                categoryTotalAmounts['Loan']!,
            11000);
      });
    } catch (error) {
      print('Error: $error');
      // Handle error if needed
    }
  }

  double calculateLowPercentage(double value, int maxValue) {
    // Calculate the low percentage based on the given value and max value
    double lowPercentage = (value / maxValue) * 100;
    return lowPercentage;
  }

  _StatsPageState createState() => _StatsPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonTopBar(
        backgroundcolor: Color(0xFFBCCFFF),
      ),
      drawer: const MenuDrawer(
        drawerGradient: [Color(0xFFA1C4FD), Color(0xFFC2E9FB)],
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
                  PercentageCircle(
                    percentage: direct,
                    color: Colors.green,
                  ),
                ),
                _subWidgets(
                  180,
                  180,
                  10,
                  PercentageCircle(
                    percentage: indirect,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const ReportWidget(
              score: 62,
            ),
            ReportWidget(
              score: piPoints.toInt(),
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
