import 'package:flutter/material.dart';
import 'package:pi_carbon_tracer/main.dart';
import 'package:pi_carbon_tracer/pages/authorization/auth_page.dart';

import '../subpages/profile/about_us.dart';
import '../subpages/profile/account_details.dart';
import '../subpages/profile/help_support.dart';
import '../subpages/profile/privacy_policy.dart';
import '../subpages/profile/settings.dart';
import '../models/menu_drawer.dart';
import '../widgets/common_top_bar.dart';
import '../models/buttons.dart';

String _imageData = 'png1.jpeg';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String username = 'Username';

  void _handleStateChange(String data) {
    setState(() {
      _imageData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonTopBar(
          backgroundcolor: Color(0xFFBCCFFF),
        ),
        drawer: const MenuDrawer(
          drawerGradient: [Color(0xFF4DA6FF), Color(0xFF3670E5)],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffA1C4FD), Color(0xffC2E9FB)],
            ),
          ),
          child: _profileBase(),
        ));
        ));
  }

  // this method contains the foundation of this page
  ListView _profileBase() {
    List<Color> buttonGradient = [
      const Color(0xFF96B0F2),
      const Color(0xFF7BCCFF)
    ];
    return ListView(
      children: [
        _photoAndEditButton(),
        Container(
          height: 400,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/profile_folder/$_imageData'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
              color: const Color(0xFF59A8F7),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 5.0,
                  blurRadius: 5.0,
                  offset: Offset(3, 3),
                ),
              ],
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
            child: CustomPopupButton(
              dimensions: const [200, 40],
              content: ProfileGallery(
                onStateChange: _handleStateChange,
              ),
              label: 'Edit Profile',
              labelSize: 20,
              gradient: const [Color(0xFF96B0F2), Color(0xFF7BCCFF)],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileGallery extends StatefulWidget {
  const ProfileGallery({
    super.key,
    required this.onStateChange,
  });

  final Function(String) onStateChange;

  @override
  State<ProfileGallery> createState() => _ProfileGalleryState();
}

class _ProfileGalleryState extends State<ProfileGallery> {
  final Map profileData = {
    '1': 'png1.jpeg',
    '2': 'png2.jpeg',
    '3': 'png3.jpeg',
    '4': 'png4.jpeg',
    '5': 'png5.jpeg',
    '6': 'png6.jpeg',
    '7': 'png7.jpeg',
    '8': 'png8.jpeg',
    '9': 'png9.jpeg',
    '10': 'png10.jpeg',
    '11': 'png11.jpeg',
    '12': 'png12.jpeg',
    '13': 'png13.jpeg',
    '14': 'png14.jpeg',
    '15': 'png15.jpeg',
    '16': 'png16.jpeg',
    '17': 'png17.jpeg',
    '18': 'png18.jpeg',
    '19': 'png19.jpeg',
    '20': 'png20.jpeg',
    '21': 'png21.jpeg',
    '22': 'png22.jpeg',
    '23': 'png23.jpeg',
    '24': 'png24.jpeg',
    '25': 'png25.jpeg',
    '26': 'png26.jpeg',
    '27': 'png27.jpeg',
    '28': 'png28.jpeg',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 500,
        height: 350,
        color: Colors.transparent,
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            _pairedProfileButtons(1, 3),
            const SizedBox(
              height: 10,
            ),
            _pairedProfileButtons(4, 5),
            const SizedBox(
              height: 10,
            ),
            _pairedProfileButtons(6, 8),
            const SizedBox(
              height: 10,
            ),
            _pairedProfileButtons(9, 10),
            const SizedBox(
              height: 10,
            ),
            _pairedProfileButtons(11, 13),
            const SizedBox(
              height: 10,
            ),
            _pairedProfileButtons(14, 15),
            const SizedBox(
              height: 10,
            ),
            _pairedProfileButtons(16, 18),
            const SizedBox(
              height: 10,
            ),
            _pairedProfileButtons(19, 20),
            const SizedBox(
              height: 10,
            ),
            _pairedProfileButtons(21, 23),
            const SizedBox(
              height: 10,
            ),
            _pairedProfileButtons(24, 25),
            const SizedBox(
              height: 10,
            ),
            _pairedProfileButtons(26, 28),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Row _pairedProfileButtons(int start, int end) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _generateElements(start, end),
    );
  }

  List<Widget> _generateElements(int start, int end) {
    List<Widget> elements = [];
    for (int i = start; i <= end && i <= profileData.length; ++i) {
      elements.add(_circularButton(i.toString()));
    }
    return elements;
  }

  Container _circularButton(String data) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/profile_folder/${profileData[data]}'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
        color: Colors.blue,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: Offset(-3, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            widget.onStateChange(profileData[data]);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Text(''),
      ),
    );
  }
}
