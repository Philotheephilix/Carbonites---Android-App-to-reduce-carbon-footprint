import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  final Color drawerColor;

  const MenuDrawer({required this.drawerColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: drawerColor,
            ),
            child: const Text(
              'Menu Header',
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Option 1'),
            onTap: () {
              // Handle option 1
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Option 2'),
            onTap: () {
              // Handle option 2
              Navigator.pop(context); // Close the drawer
            },
          ),
          // Add more ListTile widgets for additional options
        ],
      ),
    );
  }
}
