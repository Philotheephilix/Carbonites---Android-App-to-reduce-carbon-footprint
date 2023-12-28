import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pi_carbon_tracer/models/buttons.dart';

class CustomTemplates extends StatefulWidget {
  const CustomTemplates({super.key});

  @override
  State<CustomTemplates> createState() => _CustomTemplatesState();
}

class _CustomTemplatesState extends State<CustomTemplates> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 610,
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Breaking News',
              style: TextStyle(
                fontFamily: 'Capriola',
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TargetPercentIndicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Center(
              child: CustomPopupButton(
                  dimensions: [200, 50],
                  content: TemplateContent(),
                  label: "Contribute",
                  labelSize: 16,
                  gradient: [Colors.blue, Colors.blue]),
            )
          ],
        ),
      ),
    );
  }
}

class TemplateContent extends StatelessWidget {
  const TemplateContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 400.0,
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}



class TargetPercentIndicator extends StatefulWidget {
  const TargetPercentIndicator({super.key});

  @override
  State<TargetPercentIndicator> createState() => _TargetPercentIndicatorState();
}

class _TargetPercentIndicatorState extends State<TargetPercentIndicator> {
  final double totalLength = 150;
  final double _targetPercentage = 75;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Target',
              style: TextStyle(
                fontFamily: 'Capriola',
                fontSize: 14,
              ),
            ),
            Container(
              width: totalLength,
              height: 20,
              color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: totalLength * (_targetPercentage / 100),
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text(
              '${_targetPercentage.toString()}%',
            ),
          ],
        ),
      ),
    );
  }
}
