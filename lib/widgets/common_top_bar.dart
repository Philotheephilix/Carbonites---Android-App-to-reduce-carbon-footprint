import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonTopBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundcolor;

  const CommonTopBar({required this.backgroundcolor, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundcolor,
      centerTitle: true,
      // menu icon
      leading: IconButton(
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
          width: 40,
          height: 40,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      // center text
      title: const Text(
        'Carbon PI',
        style: TextStyle(
          color: Color(0xff000000),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
