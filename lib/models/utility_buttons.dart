import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/subpages/home/leader_board.dart';
import 'package:pi_carbon_tracer/subpages/home/my_goals.dart';
import 'package:pi_carbon_tracer/subpages/home/ocr.dart';

class UtilityButtons extends StatelessWidget {
  const UtilityButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: Colors.transparent,
      padding: const EdgeInsets.all(10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Utility',
            style: TextStyle(
              fontFamily: 'Capriola',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Buttons(
                  label: 'OCR',
                  page: OcrPage(),
                ),
                SizedBox(
                  width: 10,
                ),
                Buttons(
                  label: 'Goals',
                  page: MyGoalsPage(),
                ),
                SizedBox(
                  width: 10,
                ),
                Buttons(
                  label: 'Leaderboard',
                  page: LeaderboardPage(),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.label,
    required this.page,
  });

  final String label;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Capriola',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
