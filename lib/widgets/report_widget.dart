import 'dart:math';

import 'package:flutter/material.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({
    super.key,
    required this.score,
  });

  final int score;

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Report',
            style: TextStyle(
              fontFamily: 'Capriola',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                const CategoryWisePercentBar(),
                Container(
                  height: 140,
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(20),
                  child: const PercentIndicators(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'All around score: ${widget.score}',
                    style: const TextStyle(
                      fontFamily: 'Capriola',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PercentIndicators extends StatefulWidget {
  const PercentIndicators({
    super.key,
  });

  @override
  State<PercentIndicators> createState() => _PercentIndicatorsState();
}

class _PercentIndicatorsState extends State<PercentIndicators> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _dataElement(Colors.pink, 62),
            _dataElement(Colors.green, 62),
            _dataElement(Colors.red, 62),
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _dataElement(Colors.blue, 62),
            _dataElement(Colors.orange, 62),
            _dataElement(Colors.redAccent, 62)
          ],
        ),
      ],
    );
  }

  Row _dataElement(Color color, int percent) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(percent.toString()),
      ],
    );
  }
}

class CategoryWisePercentBar extends StatefulWidget {
  const CategoryWisePercentBar({
    super.key,
  });

  @override
  State<CategoryWisePercentBar> createState() => _CategoryWisePercentBarState();
}

class _CategoryWisePercentBarState extends State<CategoryWisePercentBar> {
  @override
  Widget build(BuildContext context) {
    double widgetHeight = 15;
    return Container(
      height: 60.0,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Container(
          height: widgetHeight,
          width: 310,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 62,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                ),
              ),
              Container(
                width: 62,
                color: Colors.blue,
              ),
              Container(
                width: 62,
                color: Colors.green,
              ),
              Container(
                width: 62,
                color: Colors.orange,
              ),
              Container(
                width: 62,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}