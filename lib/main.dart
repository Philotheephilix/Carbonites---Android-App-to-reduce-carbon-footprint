// ignore_for_file: avoid_print

import 'package:flutter/material.dart'
    show BuildContext, Key, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:mongo_dart/mongo_dart.dart' show Db, where, DbCollection;
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' show Db, where;
//import 'package:pi_carbon_tracer/const.dart';
//import 'package:pi_carbon_tracer/main_interface/main_page.dart';
import 'main_interface/onboarding_screen.dart';

//import 'pages/login.dart`';
//import 'pages/stats.dart';
//import 'pages/manage.dart';
//import 'pages/profile.dart';
//import 'subpages/payment_history.dart';
// ignore: non_constant_identifier_names
import 'dart:io';

void addTransaction(Map<String, dynamic> documentData) async {
  var db = await DB.getDB();

  if (db != null) {
    var collection = db.collection('philo');
    await collection.insert(documentData);
    print("added");
  }
}

Future<int> calculateTotalPriceForMonth(int targetMonth) async {
  var db = await DB.getDB();
  if (db != null) {
    var collection = db.collection('philo');
    var query = where.eq('month', targetMonth);

    var cursor = collection.find(query);
    var totalPrice = 0;

    await cursor.forEach((document) {
      var price = document['amount'];
      if (price is int) {
        totalPrice += price;
      } else if (price is num) {
        totalPrice += price.toInt();
      } else {}
    });

    return totalPrice;
  }
  return 0;
}

Future<void> requestStoragePermission() async {
  if (await Permission.storage.request().isGranted) {
    print('Storage permission is granted');
  } else {
    print('Storage permission is not granted');
  }
}

Future<void> createAppDataDirectory() async {
  try {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    Directory appDataDir = Directory('${appDocDir.path}/app_data');
    if (!await appDataDir.exists()) {
      await appDataDir.create(recursive: true);
      print('App Data Directory created');
    } else {
      print('App Data Directory already exists');
    }
  } catch (e) {
    print('Error creating directory: $e');
  }
}

String Client_name = "";
Future<bool> loginin(String user, String passs) async {
  var db = await DB.getDB();

  if (db != null) {
    var collection = db.collection('customerdata');
    var val = await collection.findOne(where.eq("email", user));

    print('Found: $val');

    if (val != null) {
      return true;
    } else {
      return false;
    }
  }
  return false;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = await DB.getDB();

  if (db != null) {
    var collection = db.collection('studentDet');
    var val = await collection
        .findOne(where.eq("R", "22CS151").fields(['Reg No', '311122104064']));
    print('Found: $val');
    print(db);
    var collectionNames = await db.getCollectionNames();

    print('Collections in the database:');
    for (var name in collectionNames) {
      print(name);
    }
  } else {
    print('Database connection failed.');
  }

  runApp(const MyApp());
}

class DB {
  static Db? _db;

  static String _getConnectionString() {
    return "mongodb+srv://maintainer_philix:qwertyuiop@carbonpi.hiozz58.mongodb.net/Project-X?retryWrites=true&w=majority";
  }

  static Future<Db?> getDB() async {
    try {
      if (_db == null) {
        _db = await Db.create(_getConnectionString());
        await _db?.open();
      }
      if (_db != null && _db?.isConnected == true) {
        return _db;
      }
      await _db?.close();
      await _db?.open();
      if (_db != null && _db?.isConnected == true) {
        return _db;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

@override
Widget build(BuildContext context) {
  throw UnimplementedError();
}
