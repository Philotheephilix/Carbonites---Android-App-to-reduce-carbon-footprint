import 'package:flutter/material.dart';

class IconAndTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final Widget page;

  const IconAndTextButton({
    required this.icon,
    required this.text,
    required this.backgroundColor,
    required this.page,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Capriola',
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
