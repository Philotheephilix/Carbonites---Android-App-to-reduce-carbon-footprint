// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';
import '../widgets/common_top_bar.dart';
import '../widgets/custom_chart_widget_1.dart';
import '../models/percentage_circle.dart';

import 'package:pi_carbon_tracer/models/chart_widgets_1.dart';

String calculateResult(double pipoint) {
  if (pipoint >= 90) {
    return "High Percentage - Our collective efforts in reducing carbon emissions pave the way for a cleaner, sustainable future. Let's continue striving together to make our world free from harmful emissions!";
  } else if (pipoint >= 80) {
    return "Great Effort - Embracing clean energy not only reduces carbon emissions but also sets the stage for a world where our environment thrives. Keep pushing for a future powered by clean, renewable energy!";
  } else if (pipoint >= 70) {
    return "Progressing Well - As we take steps to curb carbon emissions, we contribute to a greener world for generations to come. Let's persist in our journey toward a carbon-neutral future!";
  } else if (pipoint >= 60) {
    return "On the Right Track - Transitioning to clean energy sources marks a significant milestone in our commitment to combat climate change. Every move towards a carbon-free world matters!";
  } else if (pipoint >= 50) {
    return "Halfway There - Imagine a world free from carbon emissions, where nature thrives and future generations flourish. Let's work persistently towards this vision!";
  } else if (pipoint >= 40) {
    return "Making Strides - Our dedication to clean energy is a testament to our responsibility towards the planet. Every effort brings us closer to a world liberated from harmful emissions!";
  } else if (pipoint >= 30) {
    return "Taking Action - By reducing our carbon footprint, we lay the foundation for a healthier planet. Let's amplify our efforts to create a cleaner, sustainable environment!";
  } else if (pipoint >= 20) {
    return "Start Today - Each step towards a carbon-free world is a leap towards safeguarding our planet. Let's initiate actions today that shape a cleaner, greener tomorrow!";
  } else if (pipoint >= 10) {
    return "Small Steps - Even the smallest actions count in our journey towards a world free from carbon emissions. Let's join hands and make a meaningful impact together!";
  } else {
    return "Other Cases - Envision a world where carbon emissions are a thing of the past. Let's persist in our efforts to create a sustainable future for all!";
  }
}

Future<double> value = storeperc();

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  late double value;
  late double piPoints = 0;

  @override
  void initState() {
    super.initState();
    _fetchValueAndCalculate();
  }

  Future<void> _fetchValueAndCalculate() async {
    try {
      double fetchedValue = await storeperc();
      setState(() {
        value = fetchedValue.toDouble();
        piPoints = calculateLowPercentage(value).toInt().toDouble();
      });
    } catch (error) {
      print('Error: $error');
      // Handle error if needed
    }
  }

  double calculateLowPercentage(double value) {
    double maxValue = 3200;
    double percentage = (value / maxValue) * 100;
    double invertedPercentage = percentage;
    print(value);
    print(invertedPercentage);
    return invertedPercentage;
  }

  @override
  _StatsPageState createState() => _StatsPageState();
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
                  PercentageCircle(
                    percentage: piPoints,
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
                'Overall Analysis:-',
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
              Container(
                child: Text(
                  calculateResult(piPoints),
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Capriola'),
                ),
              ),
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
