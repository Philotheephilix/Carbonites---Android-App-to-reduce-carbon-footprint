import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/main.dart';
import 'package:pi_carbon_tracer/models/buttons.dart';
import 'package:pi_carbon_tracer/widgets/chart_widgets_1.dart';

Map categoryTotalAmounts = {};

Future<Map<String, double>> getCategorySum() async {
  var db = await DB.getDB();
  if (db != null) {
    var collection = db.collection(cur_user);

    final List<Map<String, dynamic>> transactions =
        await collection.find().toList();

    Map<String, double> categoryTotalAmounts = {};
    per_amount = 0;
    for (var transaction in transactions) {
      final category = transaction['category'];
      double amount = transaction['amount'].toDouble();
      if (category == 'Travel') {
        amount = amount * .26;
        per_amount = per_amount + amount;
      } else if (category == 'Home') {
        amount = amount * .22;
        per_amount = per_amount + amount;
      } else if (category == 'Food') {
        amount = amount * .16;
        per_amount = per_amount + amount;
      } else if (category == 'Goods') {
        amount = amount * .15;
        per_amount = per_amount + amount;
      } else if (category == 'Services') {
        amount = amount * .11;
        per_amount = per_amount + amount;
      } else if (category == 'Loan') {
        amount = amount * .11;
        per_amount = per_amount + amount;
      } else if (category == 'Medicine') {
        amount = amount * .11;
        per_amount = per_amount + amount;
      } else {
        amount = amount * .10;
        per_amount = per_amount + amount;
      }
      if (categoryTotalAmounts.containsKey(category)) {
        categoryTotalAmounts[category] =
            categoryTotalAmounts[category]! + amount;
      } else {
        categoryTotalAmounts[category] = amount;
      }
    }
    print(categoryTotalAmounts["Food"]);
    print(categoryTotalAmounts);
    print((categoryTotalAmounts['Food']! / per_amount) * 310);

    return categoryTotalAmounts;
  }
  return {};
}

class ReportWidget extends StatefulWidget {
  const ReportWidget({
    super.key,
    required this.score,
  });

  final int score;

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  final List<List<dynamic>> colorCategoryData = [
    [Colors.pink, 'food'],
    [Colors.blue, 'travel'],
    [Colors.green, 'goods'],
    [Colors.orange, 'service'],
    [Colors.red, 'loan'],
    [Colors.black, ''],
  ];

  final List<List<dynamic>> colorPercentData = [
    [Colors.pink, '60'],
    [Colors.blue, '60'],
    [Colors.green, '60'],
    [Colors.orange, '60'],
    [Colors.red, '60'],
    [Colors.black, '60'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Report',
                style: TextStyle(
                  fontFamily: 'Capriola',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomPopupButton(
                dimensions: const [120.0, 40.0],
                content: _popupContainer(),
                label: 'Legends',
                labelSize: 16,
                gradient: const [Color(0xFF96B0F2), Color(0xFF7BCCFF)],
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                CategoryWisePercentBar(
                  dataList: colorPercentData,
                ),
                Container(
                  height: 140,
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(20),
                  child: PercentIndicators(
                    dataList: colorPercentData,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'All around score: ${widget.score}',
                    style: const TextStyle(
                      fontFamily: 'Capriola',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _popupContainer() {
    return Container(
      width: 300,
      height: 200,
      color: Colors.transparent,
      child: PercentIndicators(
        dataList: colorCategoryData,
      ),
    );
  }
}

class PercentIndicators extends StatelessWidget {
  const PercentIndicators({
    super.key,
    required this.dataList,
  });

  final List<List<dynamic>> dataList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dataElement(Colors.pink, 'Travel'),
            _dataElement(Colors.green, 'Goods'),
            _dataElement(Colors.red, 'Service'),
            _dataElement(Color.fromARGB(255, 172, 211, 0), 'Lifestyle'),
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dataElement(Colors.blue, 'Food'),
            _dataElement(Colors.orange, 'Loan'),
            _dataElement(Color.fromARGB(117, 244, 67, 54), 'Healthcare')
          ],
        ),
      ],
    );
  }

  Row _dataElement(Color color, String percent) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text('hello bro '),
      ],
    );
  }
}

class CategoryWisePercentBar extends StatelessWidget {
  const CategoryWisePercentBar({
    super.key,
    required this.dataList,
  });

  final List<List<dynamic>> dataList;

  @override
  Widget build(BuildContext context) {
    double widgetHeight = 15;
    return Container(
      height: 60.0,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Container(
          height: widgetHeight,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: (categoryTotalAmounts['Travel']! / per_amount) * 310,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                ),
              ),
              Container(
                width: (categoryTotalAmounts['Food']! / per_amount) * 310,
                color: Colors.blue,
              ),
              Container(
                width: (categoryTotalAmounts['Goods']! / per_amount) * 310,
                color: Colors.green,
              ),
              Container(
                width: (categoryTotalAmounts['Loan']! / per_amount) * 310,
                color: Colors.orange,
              ),
              Container(
                width: (categoryTotalAmounts['Service']! / per_amount) * 310,
                color: Colors.red,
              ),
              Container(
                width: (categoryTotalAmounts['Healthcare']! / per_amount) * 310,
                color: const Color.fromARGB(117, 244, 67, 54),
              ),
              Container(
                width: (categoryTotalAmounts['Lifestyle']! / per_amount) * 310,
                color: Color.fromARGB(255, 172, 211, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
