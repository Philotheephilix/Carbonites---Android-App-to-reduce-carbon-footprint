import 'package:flutter/material.dart';

import '../models/chart_widgets.dart';

class CustomChartWidget extends StatelessWidget {
  final double height;
  final String chartType;

  const CustomChartWidget({
    required this.height,
    required this.chartType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _chartWidget(),
        ],
      ),
    );
  }

  Container _chartWidget() {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 20,
            ),
            child: _chartDetermination(chartType),
          ),
        ],
      ),
    );
  }

  Widget _chartDetermination(String chartType) {
    switch (chartType) {
      case 'line':
        return const LineChartWidget();
      case 'column':
        return const ColumnChartWidget();
      case 'bar':
        return const BarChartWidget();
      default:
        return Container();
    }
  }
}
