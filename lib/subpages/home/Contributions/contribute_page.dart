import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/models/custom_templates.dart';

class ContributePage extends StatelessWidget {
  const ContributePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF43AC78), Color(0xFFB7E4C7)],
        ),
      ),
      child: ListView(
        children: const [
          CustomTemplates(),
          CustomTemplates(),
          CustomTemplates(),
        ],
      ),
    );
  }
}