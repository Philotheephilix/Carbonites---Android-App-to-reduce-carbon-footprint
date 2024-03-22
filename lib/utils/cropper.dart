

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
Future imageCropperPage(String? path,BuildContext context) async{
  CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path!,
      
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Color.fromARGB(255, 224, 224, 224),
            toolbarWidgetColor: Color.fromARGB(255, 38, 38, 38),
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Crop image ',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    if(croppedFile!=null){
      path = croppedFile.path;
      return path ; 
    }

    
}