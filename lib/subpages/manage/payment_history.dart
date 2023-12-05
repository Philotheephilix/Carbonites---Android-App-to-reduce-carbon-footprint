import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/main.dart';
import '../../widgets/custom_chart_widget.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  List<String> transactions = [];
  String selectedCategory = 'All';
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
        title: const Text(
          'Payment History',
          style: TextStyle(
            fontFamily: 'Capriola',
          ),
        ),
        backgroundColor: const Color(0xffADEF8D),
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Color(0xffBFF098), Color(0xff6FD6FF)],
          ),
        ),
        child: _pageLayout(),
      ),
    );
  }

  Column _pageLayout() {
    return Column(
      children: [
        const SizedBox(
          height: 250,
          child: CustomChartWidget(
            height: 190,
            chartType: 'line',
          ),
        ),
        Container(
          height: 45,
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: _ledgerNavbar(),
        ),
        LegerView(transactions: _filterTransactions(selectedCategory)),
      ],
    );
  }

  SingleChildScrollView _ledgerNavbar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _divertButton('All'),
          const SizedBox(width: 10),
          _divertButton('Food'),
          const SizedBox(width: 10),
          _divertButton('Travel'),
          const SizedBox(width: 10),
          _divertButton('Goods'),
          const SizedBox(width: 10),
          _divertButton('Service'),
          const SizedBox(width: 10),
          _divertButton('Loan'),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  ElevatedButton _divertButton(String text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedCategory = text;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(197, 255, 245, 245).withOpacity(0.5),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(235, 102, 100, 100)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Capriola',
          fontSize: 14,
        ),
      ),
    );
  }

  List<String> _filterTransactions(String category) {
    if (category == 'All') {
      return transactions;
    } else {
      return transactions
          .where((transaction) => transaction.startsWith(category))
          .toList();
    }
  }
}

class LegerView extends StatelessWidget {
  const LegerView({
    super.key,
    required this.transactions,
  });

  final List<String> transactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(199, 201, 200, 200).withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              List<String> transactionDetails = transaction.split(',');
              return ListTile(
                title: Text('Date: ${transactionDetails[2]}',
                    style: const TextStyle(fontSize: 20)),
                subtitle: Text('Category: ${transactionDetails[0]}',
                    style: const TextStyle(fontSize: 16)),
                trailing: Text(
                  '₹ ${transactionDetails[1]}',
                  style: TextStyle(fontSize: 20, color: Colors.orange[900]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
