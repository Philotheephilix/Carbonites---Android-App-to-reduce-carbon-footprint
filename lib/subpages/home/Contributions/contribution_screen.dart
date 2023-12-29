import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/subpages/home/Contributions/contribute_page.dart';
import 'package:pi_carbon_tracer/subpages/home/Contributions/share_page.dart';

class ContributeScreen extends StatefulWidget {
  const ContributeScreen({
    super.key,
  });

  @override
  State createState() => _ContributeScreenState();
}

class _ContributeScreenState extends State<ContributeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Interface',
            style: TextStyle(
              fontFamily: 'Capriola',
              fontSize: 22,
            ),
          ),
          bottom: TabBar(
            labelStyle: const TextStyle(
              color: Colors.black,
              fontFamily: 'Capriola',
            ),
            tabs: const [
              Tab(
                text: 'Contribute',
              ),
              Tab(
                text: 'Community',
              ),
            ],
            onTap: (index) {
              setState(() {});
            },
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.blue,
              child: const ContributePage(),
            ),
            Container(
              color: Colors.green,
              child: const SharePage(),
            ),
          ],
        ),
      ),
    );
  }
}
