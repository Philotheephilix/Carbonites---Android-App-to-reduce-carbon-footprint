import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/widgets/rank_display_widget.dart';

import '../../../models/rank_ladder.dart';

class CategoryWiseLeaderBoardPage extends StatefulWidget {
  const CategoryWiseLeaderBoardPage({super.key});

  @override
  State<CategoryWiseLeaderBoardPage> createState() =>
      _CategoryWiseLeaderBoardPageState();
}

class _CategoryWiseLeaderBoardPageState
    extends State<CategoryWiseLeaderBoardPage> {
  final data = [
    CategoryWiseData()._food(),
    CategoryWiseData()._travel(),
    CategoryWiseData()._goods(),
    CategoryWiseData()._service(),
    CategoryWiseData()._loan(),
  ];

  List<List<String>> _ladderData = CategoryWiseData()._food();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
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
          setState(() {
            _ladderData = data[index];
          });
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
}

class CategoryWiseData {
  List<List<String>> _food() {
    List<List<String>> names = [
      ['A', '2000 pts'],
      ['B', '1500 pts'],
      ['C', '1000 pts'],
      ['D', '500 pts'],
      ['E', '250 pts'],
    ];
    return names;
  }

  List<List<String>> _travel() {
    List<List<String>> names = [
      ['F', '2000 pts'],
      ['G', '1500 pts'],
      ['H', '1000 pts'],
      ['I', '500 pts'],
      ['J', '250 pts'],
    ];
    return names;
  }

  List<List<String>> _goods() {
    List<List<String>> names = [
      ['K', '2000 pts'],
      ['L', '1500 pts'],
      ['M', '1000 pts'],
      ['N', '500 pts'],
      ['O', '250 pts'],
    ];
    return names;
  }

  List<List<String>> _service() {
    List<List<String>> names = [
      ['P', '2000 pts'],
      ['Q', '1500 pts'],
      ['R', '1000 pts'],
      ['S', '500 pts'],
      ['T', '250 pts'],
    ];
    return names;
  }

  List<List<String>> _loan() {
    List<List<String>> names = [
      ['U', '2000 pts'],
      ['V', '1500 pts'],
      ['W', '1000 pts'],
      ['X', '500 pts'],
      ['Y', '250 pts'],
    ];
    return names;
  }
}
