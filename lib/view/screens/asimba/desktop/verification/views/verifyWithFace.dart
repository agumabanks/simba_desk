import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';

class verifyWithFace extends StatelessWidget {
  const verifyWithFace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: Get.height / 1.6,
            width: Get.width / 2,
            color: redColor,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: Get.width / 2,
              color: redColor,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
      


                  SizedBox(
                    width: 10,
                    child:  Container(
                    height: double.infinity,
                    width: 3,
                    color: white,
                  ),
                  ),

                  SizedBox(
                    width: 10,
                    child:  Container(
                    height: double.infinity,
                    width: 3,
                    color: white,
                  ),
                  ),


                  TextButton(
              onPressed: () {
                // setState(() {
                //   isCapturing = true;
                //   // Add logic to capture the face here
                // });
              },
              child: Text('Capture Face'),)
                 
                ],
              ),
            ),
          )
        ],
      ),
   
    );
  }
}