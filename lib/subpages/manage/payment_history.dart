import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/main.dart';

import '../../widgets/custom_chart_widget.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({Key? key}) : super(key: key);

  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  List<String> transactions = [];

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    var db = await DB.getDB();
    if (db != null) {
      var collection = db.collection('philo');
      final documents = await collection.find().toList();

      for (var doc in documents) {
        String fieldsConcatenated =
            '${doc['category']},${doc['amount']},${doc['month']}';

        transactions.add(fieldsConcatenated);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment History'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            child: CustomChartWidget(
              height: 190,
              chartType: 'line',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                List<String> transactionDetails = transaction.split(',');
                return ListTile(
                  title: Text('Date: ${transactionDetails[2]}',
                      style: TextStyle(fontSize: 20)),
                  subtitle: Text('Category: ${transactionDetails[0]}',
                      style: TextStyle(fontSize: 16)),
                  trailing: Text(
                    '₹ ${transactionDetails[1]}',
                    style: TextStyle(fontSize: 20, color: Colors.orange[900]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
