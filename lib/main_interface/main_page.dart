import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../pages/home.dart';
import '../pages/manage.dart';
import '../pages/profile.dart';
import '../pages/stats.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Color> containerGradient = const [Color(0xFF8CF385), Color(0xFF76ABF3)];
  int currentIndex = 0;

  final List<List<Color>> colors = [
    const [Color(0xFF8CF385), Color(0xFF76ABF3)],
    const [Color(0xFFA1C4FD), Color(0xFFC2E9FB)],
    const [Color(0xFF6FD6FF), Color(0xFFBFF098)],
    const [Color(0xFF4DA6FF), Color(0xFF3670E5)],
  ];

  final screen = [
    const HomePage(),
    const StatsPage(),
    const ManagePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: _floatingNavBar(),
      extendBody: true,
    );
  }

  Padding _floatingNavBar() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: containerGradient,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: GNav(
          gap: 8,
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              backgroundGradient: const LinearGradient(
                colors: [Color(0xFF5ED56E), Color(0xFF6BD3EF)],
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                  containerGradient = colors[0];
                });
              },
            ),
            GButton(
              icon: Icons.pie_chart,
              text: 'Stats',
              backgroundGradient: const LinearGradient(
                colors: [Color(0xFF7DC1E8), Color(0xFF83A7D3)],
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                  containerGradient = colors[1];
                });
              },
            ),
            GButton(
              icon: Icons.manage_history,
              text: 'Manage',
              backgroundGradient: const LinearGradient(
                colors: [Color(0xFF2ECC71), Color(0xFF27AE60)],
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                  containerGradient = colors[2];
                });
              },
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
              backgroundGradient: const LinearGradient(
                colors: [Color(0xFF5E91F7), Color(0xFF3366CC)],
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                  containerGradient = colors[3];
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
