import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/login.dart';
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
      MaterialPageRoute(builder: (context) => LoginPage()),
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
                title: 'Welcome to MyApp',
                description: 'Discover the amazing features of our app.',
                //image: 'assets/onboarding1.png',
              ),
              OnboardingPage(
                title: 'Explore Features',
                description:
                    'Explore the various features and functionalities.',
                //image: 'assets/onboarding2.png',
              ),
              OnboardingPage(
                title: 'Get Started',
                description: 'Get started now and enjoy using our app.',
                //image: 'assets/onboarding3.png',
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: ElevatedButton(
              onPressed: _currentPage == 2 ? _navigateToLoginPage : _nextPage,
              child: Text(_currentPage == 2 ? 'Get Started' : 'Next'),
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
