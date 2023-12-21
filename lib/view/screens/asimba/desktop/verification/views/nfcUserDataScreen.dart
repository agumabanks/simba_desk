import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simbadesketop/controller/simba/simbaDesktopContllor.dart';
import 'package:simbadesketop/util/app_constants.dart';

class nfcUserDataScreen extends StatelessWidget {
  const nfcUserDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SimbaDesktopController simbaController = Get.put(
        SimbaDesktopController(
            simbaRepo: Get.find(), sharedPreferences: Get.find()));

    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: white,
        child: Row(
          children: [
            Container(
              height: Get.height,
              width: Get.width / 2.5,
              color: greenColor,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 250,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                      '${AppConstants.mainUrls}imagefile?path=${simbaController.userNfcProfileData['front_photo_url']}',
                    )),
                    color: Color.fromARGB(255, 253, 253, 253),
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Stack(
                children: [
                  Positioned(
                    
                    bottom:20, right:10, child: ElevatedButton(onPressed: () 
                    { 
                       simbaController.resetUserNfcDetails();
                       simbaController.tagId = '';
                       Get.back(); 
                    },
                    child: const Text("back"),
                    )),

                  Center(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                              "${simbaController.userNfcProfileData['first_name']}"),
                          10.width,
                          Text(
                              "${simbaController.userNfcProfileData['middle_name']}"),
                        ],
                      ),
                      Text("${simbaController.userNfcProfileData['user_id']}"),
                      Text("${simbaController.userNfcProfileData['user_id']}"),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
