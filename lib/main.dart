// ignore_for_file: avoid_print

import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:mongo_dart/mongo_dart.dart' show Db, where;
import 'package:flutter/material.dart';
//import 'package:pi_carbon_tracer/main_interface/main_page.dart';
import 'main_interface/onboarding_screen.dart';

//import 'pages/login.dart';
//import 'pages/stats.dart';
//import 'pages/manage.dart';
//import 'pages/profile.dart';
//import 'subpages/payment_history.dart';

Future<bool> loginin(String user, String pass) async {
  var db = await DB.getDB();

  if (db != null) {
    var collection = db.collection('studentDet');
    var val = await collection
        .findOne(where.eq("Roll No", user).fields(["Reg No", "0"]));
    var val1 = await collection
        .findOne(where.eq("Reg No", pass).fields(["Roll No", user]));
    print('Found: $val');
    print(val1);
    print(user);
    print(pass);
    if (val != null) {
      return true;
    } else {
      return false;
    }
  }
  return false;
}

void main() async {
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
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
