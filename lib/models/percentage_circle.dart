import 'package:flutter/material.dart';

class PercentageCircle extends StatelessWidget {
  final double percentage;
  final Color color;

  const PercentageCircle({
    required this.percentage,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _percentageCircle(color),
          Center(
            child: Text(
              percentage.toString(),
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: 'Capriola',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _percentageCircle(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            value: percentage / 100,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
