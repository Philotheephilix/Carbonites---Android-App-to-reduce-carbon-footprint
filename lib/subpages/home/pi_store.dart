import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PiStore extends StatelessWidget {
  const PiStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redirecting..."),
      ),
      body: Center(
        child: FutureBuilder<void>(
          future: _launchWebsite(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Redirecting...');
            }
          },
        ),
      ),
    );
  }

  Future<void> _launchWebsite() async {
    const url = 'https://google.com'; // Replace with your website URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: PiStore(),
  ));
}
