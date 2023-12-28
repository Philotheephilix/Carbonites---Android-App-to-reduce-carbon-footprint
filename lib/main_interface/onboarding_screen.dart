import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/authorization/auth_page.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _navigateToLoginPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboardingCompleted', true);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const AuthorizationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [
              OnboardingPage(
                title: 'Welcome to Carbon PI',
                description: '',
                image: 'assets/images/CarbonPI_icon.png',
              ),
              OnboardingPage(
                title: 'Small Footprint, Big Difference',
                description: 'Empower change with a small carbon '
                    'footprint using our convenient carbon '
                    'calculator at your fingertips!',
                image: 'assets/images/onboarding1.jpg',
              ),
              OnboardingPage(
                title: "Carbon Footprint Slimming:"
                    "A Planet’s Winning'",
                description: 'Small acts, when multiplied by millions '
                    'of people, can transform the world. '
                    'Reduce your carbon footprint and leave a '
                    'lasting impact on our planet.',
                image: 'assets/images/onboarding2.jpg',
              ),
              OnboardingPage(
                title: 'Cut Carbon, Save Tomorrow',
                description: 'Set personalized carbon goals and '
                    'receive insightful recommendations as '
                    'you embark on your journey to reduce '
                    'your carbon footprint. Start making a '
                    'positive impact today!',
                image: 'assets/images/onboarding3.jpg',
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: ElevatedButton(
              onPressed: _currentPage == 3 ? _navigateToLoginPage : _nextPage,
              child: Text(_currentPage == 3 ? 'Get Started' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
