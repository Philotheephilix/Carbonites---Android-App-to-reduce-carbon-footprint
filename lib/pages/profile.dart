import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/pages/authorization/login.dart';

import '../subpages/profile/about_us.dart';
import '../subpages/profile/account_details.dart';
import '../subpages/profile/help_support.dart';
import '../subpages/profile/privacy_policy.dart';
import '../subpages/profile/settings.dart';
import '../widgets/menu_drawer.dart';
import '../widgets/common_top_bar.dart';
import '../models/buttons.dart';

class ProfilePage extends StatelessWidget {
  final String username = 'Username';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonTopBar(
        backgroundcolor: Color(0xffEFEFEF),
      ),
      drawer: const MenuDrawer(
        drawerColor: Color(0xffEFEFEF),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.grey],
          ),
        ),
        child: _profileBase(),
      ),
    );
  }

  // this method contains the foundation of this page
  ListView _profileBase() {
    return ListView(
      children: [
        _photoAndEditButton(),
        Container(
          height: 400,
          color: Colors.transparent,
          padding: const EdgeInsets.only(
            top: 10,
            left: 60,
            right: 60,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconAndTextButton(
                icon: Icons.person,
                text: 'About us',
                backgroundColor: Color.fromARGB(189, 150, 150, 150),
                page: AboutUsPage(),
              ),
              IconAndTextButton(
                icon: Icons.account_box,
                text: 'Account Details',
                backgroundColor: Color.fromARGB(189, 150, 150, 150),
                page: AccountDetailsPage(),
              ),
              IconAndTextButton(
                icon: Icons.privacy_tip,
                text: 'Privacy policy',
                backgroundColor: Color.fromARGB(189, 150, 150, 150),
                page: PrivacyPolicyPage(),
              ),
              IconAndTextButton(
                icon: Icons.info,
                text: 'Help & Support',
                backgroundColor: Color.fromARGB(189, 150, 150, 150),
                page: HelpAndSupportPage(),
              ),
              IconAndTextButton(
                icon: Icons.settings,
                text: 'Settings',
                backgroundColor: Color.fromARGB(189, 150, 150, 150),
                page: SettingsPage(),
              ),
              IconAndTextButton(
                icon: Icons.logout,
                text: 'Logout',
                backgroundColor: Color.fromARGB(189, 150, 150, 150),
                page: LoginPage(),
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
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SelectableText(
            username,
            style: const TextStyle(
              fontFamily: 'Capriola',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color.fromARGB(255, 126, 126, 126),
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
        ],
      ),
    );
  }
}
