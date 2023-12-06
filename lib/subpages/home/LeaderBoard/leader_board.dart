import 'package:flutter/material.dart';

import 'main_leaderboard.dart';
import 'category_wise_leaderboard.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(
            fontFamily: 'Capriola',
            fontSize: 22,
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF93DB85),
      ),
      body: PageView(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF99D98C), Color(0xFF52B69A)],
              ),
            ),
            child: const MainLeaderBoardPage(),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF99D98C), Color(0xFF52B69A)],
              ),
            ),
            child: const CategoryWiseLeaderBoardPage(),
          )
        ],
      ),
    );
  }
}
