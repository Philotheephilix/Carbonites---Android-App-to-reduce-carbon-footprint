import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class permission extends StatefulWidget {
  const permission({Key? key}) : super(key: key);

  @override
  _Permission createState() => _Permission();
}

Future<bool> _requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  } else {
    var result = await permission.request();
    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}

class _Permission extends State<permission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Storage Permission in Android (11, 12, and 13)',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var status = await Permission.storage.status;
            if (status.isGranted) {
              print("Permission is already granted");
            } else if (status.isDenied) {
              var result = await _requestPermission(Permission.storage);
              if (result) {
                print("Permission granted");
              } else {
                print("Permission not granted");
              }
            } else if (status.isPermanentlyDenied) {
              // Prompt user to grant permission via system settings
              print("Permission is permanently denied");
            }
          },
          child: Text('click'),
        ),
      ),
    );
  }
}
