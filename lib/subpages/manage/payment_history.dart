import 'package:flutter/material.dart';

import '../../widgets/custom_chart_widget.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffADEF8D),
        foregroundColor: Colors.black,
        title: const Text(
          'Payment History',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const CustomChartWidget(
        height: 190,
        chartType: 'line',
      ),
    );
  }
}
