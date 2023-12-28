import 'package:flutter/material.dart';

import '../main_interface/main_page.dart';
import '../subpages/manage/new_payments.dart';
import '../widgets/common_top_bar.dart';
import '../models/menu_drawer.dart';
import '../models/buttons.dart';
import '../subpages/manage/payment_history.dart';

class ManagePage extends StatelessWidget {
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonTopBar(
        backgroundcolor: Color(0xff9AECAB),
      ),
      drawer: const MenuDrawer(
        drawerGradient: [Color(0xFF6FD6FF), Color(0xFFBFF098)],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff9DEC98), Color(0xff509BF7)],
          ),
        ),
        child: _managePageLayout(),
      ),
    );
  }

  ListView _managePageLayout() {
    List<Color> buttonGradient = [
      const Color(0xFF9AECAB),
      const Color(0xFF85D896)
    ];
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
            child: Image.asset('assets/images/transfer.png'),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconAndTextButton(
                icon: Icons.currency_rupee,
                text: 'New Payment',
                buttonGradient: buttonGradient,
                page: const MyTransactionPage(),
              ),
              IconAndTextButton(
                icon: Icons.history,
                text: 'Payment history',
                buttonGradient: buttonGradient,
                page: const PaymentHistoryPage(),
              ),
              IconAndTextButton(
                icon: Icons.category,
                text: 'Categories',
                buttonGradient: buttonGradient,
                page: const MainScreen(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
