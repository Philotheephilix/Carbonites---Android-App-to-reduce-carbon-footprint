import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/pages/authorization/auth_page.dart';
import 'package:pi_carbon_tracer/pages/authorization/login.dart';

import '../subpages/profile/about_us.dart';
import '../subpages/profile/account_details.dart';
import '../subpages/profile/help_support.dart';
import '../subpages/profile/privacy_policy.dart';
import '../subpages/profile/settings.dart';
import '../models/menu_drawer.dart';
import '../widgets/common_top_bar.dart';
import '../models/buttons.dart';

class ProfilePage extends StatelessWidget {
  final String username = 'Username';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonTopBar(
        backgroundcolor: Color(0xff3399FF),
      ),
      drawer: const MenuDrawer(
        drawerGradient: [Color(0xFF4DA6FF), Color(0xFF3670E5)],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF3399FF), Color(0xFF3366CC)],
          ),
        ),
        child: _profileBase(),
      ),
    );
  }

  // this method contains the foundation of this page
  ListView _profileBase() {
    List <Color> buttonGradient = [const Color(0xFF467CE8), const Color(0xFF3366CC)];
    return ListView(
      children: [
        _photoAndEditButton(),
        Container(
          height: 400,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconAndTextButton(
                icon: Icons.person,
                text: 'About us',
                buttonGradient: buttonGradient,
                page: const AboutUsPage(),
              ),
              IconAndTextButton(
                icon: Icons.account_box,
                text: 'Account Details',
                buttonGradient: buttonGradient,
                page: const AccountDetailsPage(),
              ),
              IconAndTextButton(
                icon: Icons.privacy_tip,
                text: 'Privacy policy',
                buttonGradient: buttonGradient,
                page: const PrivacyPolicyPage(),
              ),
              IconAndTextButton(
                icon: Icons.info,
                text: 'Help & Support',
                buttonGradient: buttonGradient,
                page: const HelpAndSupportPage(),
              ),
              IconAndTextButton(
                icon: Icons.settings,
                text: 'Settings',
                buttonGradient: buttonGradient,
                page: const SettingsPage(),
              ),
              IconAndTextButton(
                icon: Icons.logout,
                text: 'Logout',
                buttonGradient: buttonGradient,
                page: const AuthorizationPage(),
              )
            ],
          ),
        ),
      ],
    );
  }

  // this method contains the design for the profile pic and edit button
  Container _photoAndEditButton() {
    return Container(
      height: 300,
      color: Colors.transparent,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 148,
            width: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF59A8F7),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SelectableText(
            username,
            style:  const TextStyle(
              fontFamily: 'Capriola',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3399FF), Color(0xFF3670E5)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  shadowColor: Colors.transparent,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Edit profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Capriola',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
