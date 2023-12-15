import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simbadesketop/controller/simba/simbaDesktopContllor.dart';

class ImageWidget extends StatelessWidget {





  final SimbaDesktopController imagePickerController = Get.put(SimbaDesktopController(simbaRepo: Get.find(), sharedPreferences: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passport Photo App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => imagePickerController.isImagePicked.value
                  ? Image.file(File(imagePickerController.pickedImagePath.value))
                  : CircularProgressIndicator(),
            ),
            ElevatedButton(
              onPressed: () {
                imagePickerController.pickImage();
              },
              child: Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}