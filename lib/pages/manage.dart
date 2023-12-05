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
        backgroundcolor: Color(0xffADEF8D),
      ),
      drawer: const MenuDrawer(
        drawerGradient: [Color(0xFF6FD6FF), Color(0xFFBFF098)],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff6FD6FF), Color(0xffBFF098)],
          ),
        ),
        child: _managePageLayout(),
      ),
    );
  }

  ListView _managePageLayout() {
    List <Color> buttonGradient = [const Color(0xFF2ECC71), const Color(0xFF27AE60)];
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
