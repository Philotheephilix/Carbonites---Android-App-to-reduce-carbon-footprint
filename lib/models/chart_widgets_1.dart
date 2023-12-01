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
  Map<String, double> categorySum = await getCategorySum();
  List<MonthlyData> monthlyData = [];

  categorySum.forEach((category, totalAmount) {
    monthlyData.add(MonthlyData(category, totalAmount.toInt()));
  });

  return monthlyData;
}

Future<Map<String, double>> getCategorySum() async {
  var db = await DB.getDB();
  if (db != null) {
    var collection = db.collection('philo');

    final List<Map<String, dynamic>> transactions =
        await collection.find().toList();

    Map<String, double> categoryTotalAmounts = {};

    for (var transaction in transactions) {
      final category = transaction['category'];
      final amount = transaction['amount'].toDouble();

      if (categoryTotalAmounts.containsKey(category)) {
        categoryTotalAmounts[category] =
            categoryTotalAmounts[category]! + amount;
      } else {
        categoryTotalAmounts[category] = amount;
      }
    }

    return categoryTotalAmounts;
  }
  return {};
}

Future<Map<String, double>> getMonthSum() async {
  var db = await DB.getDB();
  if (db != null) {
    var collection = db.collection('philo');

    final List<Map<String, dynamic>> transactions =
        await collection.find().toList();

    Map<String, double> monthTotalAmounts = {};

    for (var transaction in transactions) {
      final category = transaction['month'];
      final amount = transaction['amount'].toDouble();

      if (monthTotalAmounts.containsKey(category)) {
        monthTotalAmounts[category] = monthTotalAmounts[category]! + amount;
      } else {
        monthTotalAmounts[category] = amount;
      }
    }

    return monthTotalAmounts;
  }
  return {};
}

class MonthlyData {
  final String month;
  final int sales;

  MonthlyData(this.month, this.sales);
}
