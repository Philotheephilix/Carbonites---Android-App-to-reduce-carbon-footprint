import 'package:flutter/material.dart';
//import 'package:pi_carbon_tracer/main_interface/main_page.dart';

import 'main_interface/onboarding_screen.dart';
//import 'pages/login.dart';
//import 'pages/stats.dart';
//import 'pages/manage.dart';
//import 'pages/profile.dart';
//import 'subpages/payment_history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This is the root of your application
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
