import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/widgets/menu_drawer.dart';

import '../widgets/common_top_bar.dart';
import '../widgets/horizontal_scroll_bar.dart';

class HomePage extends StatelessWidget {
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
      body: ListView(
        children: [
          const HorizontalScrollBar(),
          Container(
            width: 415,
            height: 400,
            color: Colors.pink,
          ),
          Container(
            width: 415,
            height: 400,
            color: Colors.blue,
          ),
          Container(
            width: 415,
            height: 400,
            color: Colors.red,
          ),
          Container(
            width: 415,
            height: 400,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
