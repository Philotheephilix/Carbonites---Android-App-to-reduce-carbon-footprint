import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/main.dart';
import 'package:pi_carbon_tracer/widgets/rank_display_widget.dart';
import 'package:mongo_dart/mongo_dart.dart' show where;

import '../../../models/rank_ladder.dart';

int place_cur_user = 1;

class CategoryWiseLeaderBoardPage extends StatefulWidget {
  const CategoryWiseLeaderBoardPage({super.key});

  @override
  State<CategoryWiseLeaderBoardPage> createState() =>
      _CategoryWiseLeaderBoardPageState();
}

class _CategoryWiseLeaderBoardPageState
    extends State<CategoryWiseLeaderBoardPage> {
  List<List<String>> _ladderData = [];
  late List<Future<List<List<String>>>> data =
      []; // Initialize 'data' as an empty list

  Future<void> _initializeData() async {
    // Instead of directly assigning values, await the asynchronous operations
    List<List<String>> foodData = await CategoryWiseData()._food();
    List<List<String>> travelData = await CategoryWiseData()._travel();
    List<List<String>> goodsData = await CategoryWiseData()._goods();
    List<List<String>> serviceData = await CategoryWiseData()._service();
    List<List<String>> loanData = await CategoryWiseData()._loan();
    List<List<String>> healthcareData = await CategoryWiseData()._healthcare();
    List<List<String>> lifestyleData = await CategoryWiseData()._lifestyle();

    // Now that you have the data, you can update your UI or assign it to the ladderData
    setState(() {
      _ladderData = foodData; // or any other data you wish to use
    });
  }

  @override
  void initState() {
    super.initState();
    data = [
      CategoryWiseData()._food(),
      CategoryWiseData()._travel(),
      CategoryWiseData()._goods(),
      CategoryWiseData()._service(),
      CategoryWiseData()._loan(),
      CategoryWiseData()._lifestyle(),
      CategoryWiseData()._healthcare(),
    ];
    _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          // Widgets that depend on the _ladderData should be placed here
          _categoryBar(),
          const SizedBox(
            height: 10.0,
          ),
          const RankDisplayWidget(),
          RankLadder(candidateNames: _ladderData),
        ],
      ),
    );
  }

  SingleChildScrollView _categoryBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _divertButton('Food', 0),
          const SizedBox(width: 10),
          _divertButton('Travel', 1),
          const SizedBox(width: 10),
          _divertButton('Goods', 2),
          const SizedBox(width: 10),
          _divertButton('Service', 3),
          const SizedBox(width: 10),
          _divertButton('Loan', 4),
          const SizedBox(width: 10),
          _divertButton('Healthcare', 5),
          const SizedBox(width: 10),
          _divertButton('Lifestyle', 6),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Container _divertButton(String text, int index) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: const Color(0xFF52B69A),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          _handleButtonPress(index);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Capriola',
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  void _handleButtonPress(int index) async {
    List<List<String>> selectedData = [];
    switch (index) {
      case 0:
        selectedData = await CategoryWiseData()._food();
        break;
      case 1:
        selectedData = await CategoryWiseData()._travel();
        break;
      case 2:
        selectedData = await CategoryWiseData()._goods();
        break;
      case 3:
        selectedData = await CategoryWiseData()._service();
        break;
      case 4:
        selectedData = await CategoryWiseData()._loan();
        break;
      case 5:
        selectedData = await CategoryWiseData()._healthcare();
        break;
      case 6:
        selectedData = await CategoryWiseData()._lifestyle();
        break;
      // Add more cases for other categories if needed...
      default:
      // Handle default case if necessary
    }
    setState(() {
      _ladderData = selectedData;
    });
  }
}

class CategoryWiseData {
  Future<List<List<String>>> _food() async {
    var db = await DB.getDB();

    if (db != null) {
      var collection = db.collection('leaderboard');
      var cursor = await collection
          .find(
            where.sortBy('Food',
                descending: true), // Replace 'fieldName' with your field name
          )
          .toList();

      // Extracting data from MongoDB cursor and transforming it into the required format
      List<List<String>> names = [];
      int i = 1;
      for (var entry in cursor) { 
        List<String> rowData = [
          entry['name']?.toString() ?? '', // Ensure name is converted to String
          '${((entry['Food'] ?? 0) - 1000).toInt().abs()} pts'
        ];
        if (entry["name"] == cur_user) {
          place_cur_user = i;
        } else {
          i = i + 1;
          place_cur_user = i;
        }
        names.add(rowData);
      }

      print(names);
      return names;
    }
    return [];
  }

  Future<List<List<String>>> _travel() async {
    var db = await DB.getDB();

    if (db != null) {
      var collection = db.collection('leaderboard');
      var cursor = await collection
          .find(
            where.sortBy('Travel',
                descending: true), // Replace 'fieldName' with your field name
          )
          .toList();

      // Extracting data from MongoDB cursor and transforming it into the required format
      List<List<String>> names = [];
      int i = 1;
      for (var entry in cursor) {
        List<String> rowData = [
          entry['name']?.toString() ?? '', // Ensure name is converted to String
          '${((entry['Travel'] ?? 0) - 1000).toInt().abs()} pts'
        ];
        if (entry["name"] == cur_user) {
          place_cur_user = i;
        } else {
          i = i + 1;
          place_cur_user = i;
        }
        names.add(rowData);
      }

      print(names);
      return names;
    }
    return [];
  }

  Future<List<List<String>>> _goods() async {
    var db = await DB.getDB();

    if (db != null) {
      var collection = db.collection('leaderboard');
      var cursor = await collection
          .find(
            where.sortBy('Goods',
                descending: true), // Replace 'fieldName' with your field name
          )
          .toList();

      // Extracting data from MongoDB cursor and transforming it into the required format
      List<List<String>> names = [];
      int i = 1;
      for (var entry in cursor) {
        List<String> rowData = [
          entry['name']?.toString() ?? '', // Ensure name is converted to String
          '${((entry['Goods'] ?? 0) - 1000).toInt().abs()} pts'
        ];
        if (entry["name"] == cur_user) {
          place_cur_user = i;
        } else {
          i = i + 1;
          place_cur_user = i;
        }
        names.add(rowData);
      }

      print(names);
      return names;
    }
    return [];
  }

  Future<List<List<String>>> _service() async {
    var db = await DB.getDB();

    if (db != null) {
      var collection = db.collection('leaderboard');
      var cursor = await collection
          .find(
            where.sortBy('Service',
                descending: true), // Replace 'fieldName' with your field name
          )
          .toList();

      // Extracting data from MongoDB cursor and transforming it into the required format
      List<List<String>> names = [];
      int i = 1;
      for (var entry in cursor) {
        List<String> rowData = [
          entry['name']?.toString() ?? '', // Ensure name is converted to String
          '${((entry['Service'] ?? 0) - 1000).toInt().abs()} pts'
        ];
        if (entry["name"] == cur_user) {
          place_cur_user = i;
        } else {
          i = i + 1;
          place_cur_user = i;
        }
        names.add(rowData);
      }

      print(names);
      return names;
    }
    return [];
  }

  Future<List<List<String>>> _loan() async {
    var db = await DB.getDB();

    if (db != null) {
      var collection = db.collection('leaderboard');
      var cursor = await collection
          .find(
            where.sortBy('Loan',
                descending: true), // Replace 'fieldName' with your field name
          )
          .toList();

      // Extracting data from MongoDB cursor and transforming it into the required format
      List<List<String>> names = [];
      int i = 1;
      for (var entry in cursor) {
        List<String> rowData = [
          entry['name']?.toString() ?? '', // Ensure name is converted to String
          '${((entry['Loan'] ?? 0) - 1000).toInt().abs()} pts'
        ];
        if (entry["name"] == cur_user) {
          place_cur_user = i;
        } else {
          i = i + 1;
          place_cur_user = i;
        }
        names.add(rowData);
      }

      print(names);
      return names;
    }
    return [];
  }

  Future<List<List<String>>> _lifestyle() async {
    var db = await DB.getDB();

    if (db != null) {
      var collection = db.collection('leaderboard');
      var cursor = await collection
          .find(
            where.sortBy('Lifestyle',
                descending: true), // Replace 'fieldName' with your field name
          )
          .toList();

      // Extracting data from MongoDB cursor and transforming it into the required format
      List<List<String>> names = [];
      int i = 1;
      for (var entry in cursor) {
        List<String> rowData = [
          entry['name']?.toString() ?? '', // Ensure name is converted to String
          '${((entry['Lifestyle'] ?? 0) - 1000).toInt().abs()} pts'
        ];
        if (entry["name"] == cur_user) {
          place_cur_user = i;
        } else {
          i = i + 1;
          place_cur_user = i;
        }
        names.add(rowData);
      }

      print(names);
      return names;
    }
    return [];
  }

  Future<List<List<String>>> _healthcare() async {
    var db = await DB.getDB();

    if (db != null) {
      var collection = db.collection('leaderboard');
      var cursor = await collection
          .find(
            where.sortBy('Healthcare',
                descending: true), // Replace 'fieldName' with your field name
          )
          .toList();

      // Extracting data from MongoDB cursor and transforming it into the required format
      List<List<String>> names = [];
      int i = 1;
      for (var entry in cursor) {
        List<String> rowData = [
          entry['name']?.toString() ?? '', // Ensure name is converted to String
          '${((entry['Healthcare'] ?? 0) - 1000).toInt().abs()} pts'
        ];
        if (entry["name"] == cur_user) {
          place_cur_user = i;
        } else {
          i = i + 1;
          place_cur_user = i;
        }
        names.add(rowData);
      }

      print(names);
      return names;
    }
    return [];
  }
}
