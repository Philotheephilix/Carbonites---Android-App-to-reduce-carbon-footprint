// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/main.dart';
import 'package:upi_india/upi_india.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/subpages/manage/Upi_trans.dart';

class Product {
  double price;

  Product(this.price);
}

class MyTransactionPage extends StatefulWidget {
  const MyTransactionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTransactionPageState createState() => _MyTransactionPageState();
}

class _MyTransactionPageState extends State<MyTransactionPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _category = '';
  double _price = 0.0;

  List<String> categories = ['Food', 'Travel', 'Goods', 'Service', 'Loan'];

  Future<void> _submitForm() async {
    var db = await DB.getDB();
    var dataToInsert = {};
    if (db != null) {
      var collection = db.collection(cur_user);
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        print('Category: $_category');
        print('Price: $_price');
        DateTime now = DateTime.now();
        int year = now.year;
        int month = now.month;
        int day = now.day;
        var dataToInsert = {
          'category': _category,
          'amount': _price,
          'month': month,
          'date': day,
          'year': year,
        };
        await collection.insert(dataToInsert);
        print(dataToInsert);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffADEF8D),
        foregroundColor: Colors.black,
        title: const Text(
          'New Payments',
          style: TextStyle(
            fontFamily: 'Capriola',
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Color(0xffBFF098), Color(0xff6FD6FF)],
          ),
        ),
        padding: const EdgeInsets.only(top: 100, left: 25, right: 25),
        child: _buildLayout(),
      ),
    );
  }

  Form _buildLayout() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DropdownButtonFormField<String>(
            value: _category.isNotEmpty ? _category : null,
            items: categories.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: const Text('Select Category'),
            onChanged: (value) {
              setState(() {
                _category = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a category';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Price',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a price';
              }
              if (double.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
            onSaved: (value) {
              _price = double.parse(value!);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QRScannerScreen(price: _price)),
              );
            },
            child: const Text(
              'UPI',
              style: TextStyle(
                fontFamily: 'Capriola',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text(
              'Submit',
              style: TextStyle(
                fontFamily: 'Capriola',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
