import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  late List<MonthlyData> chartData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Retrieve the data asynchronously
    List<MonthlyData> data = await generateData();
    setState(() {
      chartData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: chartData.isNotEmpty
          ? SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              enableAxisAnimation: true,
              zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true,
                enablePanning: true,
              ),
              series: <LineSeries<MonthlyData, String>>[
                LineSeries<MonthlyData, String>(
                  dataSource: chartData,
                  xValueMapper: (MonthlyData sales, _) => sales.month,
                  yValueMapper: (MonthlyData sales, _) => sales.sales,
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class ColumnChartWidget extends StatefulWidget {
  const ColumnChartWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ColumnChartWidgetState createState() => _ColumnChartWidgetState();
}

class _ColumnChartWidgetState extends State<ColumnChartWidget> {
  late List<MonthlyData> chartData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<MonthlyData> data = await generateData();
    setState(() {
      chartData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: chartData.isNotEmpty
          ? SfCartesianChart(
              series: <ColumnSeries<MonthlyData, String>>[
                ColumnSeries<MonthlyData, String>(
                  dataSource: chartData,
                  xValueMapper: (MonthlyData sales, _) => sales.month,
                  yValueMapper: (MonthlyData sales, _) => sales.sales,
                ),
              ],
            )
          : const CircularProgressIndicator(),
    );
  }
}

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BarChartWidgetState createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  late List<MonthlyData> chartData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<MonthlyData> data = await generateData();
    setState(() {
      chartData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: chartData.isNotEmpty
            ? SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                enableAxisAnimation: true,
                zoomPanBehavior: ZoomPanBehavior(
                  enablePinching: true,
                  enablePanning: true,
                ),
                series: <BarSeries<MonthlyData, String>>[
                  BarSeries<MonthlyData, String>(
                    dataSource: chartData,
                    xValueMapper: (MonthlyData sales, _) => sales.month,
                    yValueMapper: (MonthlyData sales, _) => sales.sales,
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  late List<MonthlyData> chartData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Retrieve the data asynchronously
    List<MonthlyData> data = await generateData();
    setState(() {
      chartData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: chartData.isNotEmpty
            ? SfCircularChart(
                series: <CircularSeries<MonthlyData, String>>[
                  PieSeries<MonthlyData, String>(
                    dataSource: chartData,
                    xValueMapper: (MonthlyData sales, _) => sales.month,
                    yValueMapper: (MonthlyData sales, _) => sales.sales,
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class DoughnutChartWidget extends StatefulWidget {
  const DoughnutChartWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DoughnutChartWidgetState createState() => _DoughnutChartWidgetState();
}

class _DoughnutChartWidgetState extends State<DoughnutChartWidget> {
  late List<MonthlyData> chartData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Retrieve the data asynchronously
    List<MonthlyData> data = await generateData();
    setState(() {
      chartData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Doughnut Chart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: chartData.isNotEmpty
              ? SfCircularChart(
                  series: <CircularSeries<MonthlyData, String>>[
                    DoughnutSeries<MonthlyData, String>(
                      dataSource: chartData,
                      xValueMapper: (MonthlyData sales, _) => sales.month,
                      yValueMapper: (MonthlyData sales, _) => sales.sales,
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ));
  }
}

Future<List<MonthlyData>> generateData() async {
  List<MonthlyData> monthlyData = [];
  for (int i = 1; i <= 12; i++) {
    int totalPriceForMonth = await calculateTotalPriceForMonth(i);
    int totalPriceAsInt = totalPriceForMonth.toInt();
    monthlyData.add(MonthlyData(getMonthName(i), totalPriceAsInt));
  }
  return monthlyData;
}

String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';

    default:
      return '';
  }
}

class MonthlyData {
  final String month;
  final int sales;

  MonthlyData(this.month, this.sales);
}
