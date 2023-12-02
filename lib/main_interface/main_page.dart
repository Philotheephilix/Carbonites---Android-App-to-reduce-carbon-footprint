import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pages/home.dart';
import '../pages/stats.dart';
import '../pages/manage.dart';
import '../pages/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MainPageStates createState() => _MainPageStates();
}

class _MainPageStates extends State<MainPage> {
  int currentIndex = 0;

  final screens = [
    const HomePage(),
    const StatsPage(),
    const ManagePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: _navigationBar(),
    );
  }

  BottomNavigationBar _navigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/home.png',
            width: 40,
            height: 40,
          ),
          label: '',
          backgroundColor: const Color(0xff9AECAB),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/pie-chart.svg',
            width: 40,
            height: 40,
          ),
          label: '',
          backgroundColor: const Color(0xffBCCFFF),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/footprints.svg',
            width: 40,
            height: 40,
          ),
          label: '',
          backgroundColor: const Color(0xffADEF8D),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/profile.png',
            width: 40,
            height: 40,
          ),
          label: '',
          backgroundColor: Color(0xff9DEC98),
        ),
      ],
    );
  }
}
