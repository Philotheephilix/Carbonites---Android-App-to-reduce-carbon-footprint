import 'package:flutter/material.dart';

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
        title: const Text('Leaderboard'),
      ),
      body: Container(
        color: Colors.blue,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 400,
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
