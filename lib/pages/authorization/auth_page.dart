import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/pages/authorization/login.dart';
import 'package:pi_carbon_tracer/pages/authorization/sign_up.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  State createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  bool showWidgetA = true;

  void toggleWidget() {
    setState(() {
      showWidgetA = !showWidgetA;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 800,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff9DEC98), Color(0xff509BF7)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
            child: showWidgetA
                ? LoginWidget(onToggle: toggleWidget)
                : SignUpWidget(onToggle: toggleWidget),
          ),
        ),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  final VoidCallback onToggle;

  const LoginWidget({super.key, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LoginPage(),
        Padding(
          padding: const EdgeInsets.only(top: 500),
          child: Center(
            child: ToggleButton(
              onToggle: onToggle,
              label: "Don't have an account?",
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpWidget extends StatelessWidget {
  final VoidCallback onToggle;

  const SignUpWidget({super.key, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SignUpPage(),
        Padding(
          padding: const EdgeInsets.only(top: 500),
          child: Center(
            child: ToggleButton(
              onToggle: onToggle,
              label: "Already have an account?",
            ),
          ),
        ),
      ],
    );
  }
}

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    super.key,
    required this.onToggle,
    required this.label,
  });

  final VoidCallback onToggle;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Capriola',
          color: Color.fromARGB(214, 0, 63, 139),
          fontSize: 16,
        ),
      ),
    );
  }
}
