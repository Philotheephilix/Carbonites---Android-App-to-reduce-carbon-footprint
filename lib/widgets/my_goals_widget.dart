import 'package:flutter/material.dart';

class MyGoalsWidget extends StatefulWidget {
  final double height;

  const MyGoalsWidget({
    required this.height,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MyGoalsWidgetState createState() => _MyGoalsWidgetState();
}

class _MyGoalsWidgetState extends State<MyGoalsWidget> {
  List<String> goals = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: Colors.pink,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
            child: Text(
              'My Goals',
              style: TextStyle(),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(),
          ),
        ],
      ),
    );
  }
}
