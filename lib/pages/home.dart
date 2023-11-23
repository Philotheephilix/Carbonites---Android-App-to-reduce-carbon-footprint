import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/widgets/custom_chart_widget.dart';
import 'package:pi_carbon_tracer/widgets/menu_drawer.dart';
import 'package:pi_carbon_tracer/widgets/my_goals_widget.dart';

import '../widgets/common_top_bar.dart';
import '../widgets/horizontal_scroll_bar.dart';

class HomePage extends StatelessWidget {
  final String username = 'Username';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonTopBar(
        backgroundcolor: Color(0xff9AECAB),
      ),
      drawer: const MenuDrawer(
        drawerColor: Color(0xff9AECAB),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff9DEC98), Color(0xff509BF7)],
          ),
        ),
        child: _homeLayout(),
      ),
    );
  }

  ListView _homeLayout() {
    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        _introAndIllustration(),
        const SizedBox(
          height: 5,
        ),
        const HorizontalScrollBar(),
        _sneakPeek(),
      ],
    );
  }

  Column _sneakPeek() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Sneak Peek',
            style: TextStyle(
              fontFamily: 'Capriola',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomChartWidget(
          height: 190,
          chartType: 'line',
        )
      ],
    );
  }

  Container _introAndIllustration() {
    return Container(
      height: 250,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            'Welcome $username!',
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Capriola',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 200,
            height: 150,
            child: Image.asset(
              'assets/images/trees.png',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "---One-liner---",
            style: TextStyle(
              fontFamily: 'Capriola',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
