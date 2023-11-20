import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        enableAxisAnimation: true,
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true,
          enablePanning: true,
        ),
        series: <LineSeries<MonthlyData, String>>[
          LineSeries(
            dataSource: generateData(),
            xValueMapper: (MonthlyData sales, _) => sales.month,
            yValueMapper: (MonthlyData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class ColumnChartWidget extends StatelessWidget {
  const ColumnChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        enableAxisAnimation: true,
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true,
          enablePanning: true,
        ),
        series: <ColumnSeries<MonthlyData, String>>[
          ColumnSeries(
            dataSource: generateData(),
            xValueMapper: (MonthlyData sales, _) => sales.month,
            yValueMapper: (MonthlyData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        enableAxisAnimation: true,
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true,
          enablePanning: true,
        ),
        series: <BarSeries<MonthlyData, String>>[
          BarSeries(
            dataSource: generateData(),
            xValueMapper: (MonthlyData sales, _) => sales.month,
            yValueMapper: (MonthlyData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SfCircularChart(
        series: <CircularSeries<MonthlyData, String>>[
          PieSeries(
            dataSource: generateData(),
            xValueMapper: (MonthlyData sales, _) => sales.month,
            yValueMapper: (MonthlyData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class DoughnutChartWidget extends StatelessWidget {
  const DoughnutChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SfCircularChart(
        series: <CircularSeries<MonthlyData, String>>[
          DoughnutSeries(
            dataSource: generateData(),
            xValueMapper: (MonthlyData sales, _) => sales.month,
            yValueMapper: (MonthlyData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

List<MonthlyData> generateData() {
  return [
    MonthlyData('Jan', 30),
    MonthlyData('Feb', 45),
    MonthlyData('Mar', 25),
    MonthlyData('Apr', 50),
    MonthlyData('May', 20),
    MonthlyData('Jun', 40),
    MonthlyData('Jul', 30),
    MonthlyData('Aug', 45),
    MonthlyData('Sep', 25),
    MonthlyData('Oct', 50),
    MonthlyData('Nov', 20),
    MonthlyData('Dec', 40),
  ];
}

class MonthlyData {
  final String month;
  final int sales;

  MonthlyData(this.month, this.sales);
}
