// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

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
  String _customerName = '';

  List<String> categories = [
    'Groceries',
    'Electronics',
    'Clothing',
    'Furniture',
    'Other'
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform actions with the collected data
      print('Category: $_category');
      print('Price: $_price');
      print('Customer Name: $_customerName');
      // Add further logic here to process/store the data
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
        padding:
            const EdgeInsets.only(top: 100, left: 25, right: 25),
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
