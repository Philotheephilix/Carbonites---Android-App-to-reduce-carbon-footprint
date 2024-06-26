import 'package:flutter/material.dart';

import '../subpages/manage/new_payments.dart';

class MenuDrawer extends StatelessWidget {
  final List<Color> drawerGradient;

  const MenuDrawer({
    required this.drawerGradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: drawerGradient,
              ),
            ),
            child: const Text(
              'Menu Header',
              style: TextStyle(
                color: Color(0xff000000),
                fontFamily: 'Capriola',
                fontSize: 24,
              ),
            ),
          ),
          const DropDownText(
            label: 'Home',
            icon: Icons.home_mini,
            buttonRack: [],
          ),
          const DropDownText(
            label: 'Stats',
            icon: Icons.pie_chart_outline,
            buttonRack: [],
          ),
          const DropDownText(
            label: 'Manage',
            icon: Icons.manage_history_outlined,
            buttonRack: [
              LabeledButton(
                label: 'New Payments',
                page: MyTransactionPage(),
              ),
            ],
          ),
          const DropDownText(
            label: 'Profile',
            icon: Icons.person_outline,
            buttonRack: [],
          ),
          // Add more ListTile widgets for additional options
        ],
      ),
    );
  }
}

class DropDownText extends StatelessWidget {
  const DropDownText({
    super.key,
    required this.label,
    required this.icon,
    required this.buttonRack,
  });

  final String label;
  final IconData icon;
  final List<Widget> buttonRack;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Capriola',
          ),
        ),
        leading: Icon(icon),
        childrenPadding: const EdgeInsets.only(left: 60),
        children: buttonRack,
      ),
    );
  }
}

class LabeledButton extends StatelessWidget {
  const LabeledButton({
    super.key,
    required this.label,
    required this.page,
  });

  final String label;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Capriola',
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
