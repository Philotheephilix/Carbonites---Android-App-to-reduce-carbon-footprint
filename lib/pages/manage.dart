import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/pages/add_tr.dart';

import '../main_interface/main_page.dart';
import '../widgets/common_top_bar.dart';
import '../widgets/menu_drawer.dart';
import '../models/buttons.dart';
import '../subpages/manage/payment_history.dart';

class ManagePage extends StatelessWidget {
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonTopBar(
        backgroundcolor: Color(0xffADEF8D),
      ),
      drawer: const MenuDrawer(
        drawerColor: Color(0xffADEF8D),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Color(0xffBFF098), Color(0xff6FD6FF)],
          ),
        ),
        child: _managePageLayout(),
      ),
    );
  }

  ListView _managePageLayout() {
    return ListView(
      children: [
        Container(
          height: 75,
          color: Colors.transparent,
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'My Transactions',
                  style: TextStyle(
                    fontFamily: 'Capriola',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 200 - 20,
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 200,
              height: 150,
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 200,
          color: Colors.transparent,
          padding: const EdgeInsets.only(
            left: 40,
            right: 60,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconAndTextButton(
                icon: Icons.currency_rupee,
                text: 'New Payment',
                backgroundColor: Color.fromARGB(255, 172, 240, 228),
                page: MyTransactionApp(),
              ),
              IconAndTextButton(
                icon: Icons.history,
                text: 'Payment history',
                backgroundColor: Color.fromARGB(255, 172, 240, 228),
                page: PaymentHistoryPage(),
              ),
              IconAndTextButton(
                icon: Icons.category,
                text: 'Categories',
                backgroundColor: Color.fromARGB(255, 172, 240, 228),
                page: MainPage(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
