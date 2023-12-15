import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simbadesketop/util/dimensions.dart';
import 'package:simbadesketop/util/styles.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/verification/views/verifyWithChip.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/verification/views/verifyWithFace.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/verification/views/verifyWithNfc.dart';
import 'package:simbadesketop/view/screens/auth/selfie_capture/camera_screen.dart';

class VerrificationPage extends StatefulWidget {
  const VerrificationPage({super.key});

  @override
  State<VerrificationPage> createState() => _VerrificationPageState();
}

class _VerrificationPageState extends State<VerrificationPage> {
  @override
    bool isCapturing = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VerificationScreen(),); //CameraScreen(fromEditProfile: true,)); 
        
  }

  Widget VerificationScreen(){
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 350,
                width: Get.width / 4.36 ,
                decoration: BoxDecoration(
                              color: Color.fromARGB(255, 5, 161, 125),
                              borderRadius:
                                  BorderRadius.circular(12), // Rounded corners
                            ),
                child: Column(
                  children: [
                     80.height,
                    Icon(Icons.face_sharp, size: 135, color: white,),
                    10.height,
                    Text("Face",  style: rubikMedium.copyWith(
                                                      fontSize: Dimensions
                                                          .fontSizeOverOverLarge,
                                                      color: const Color.fromARGB(
                                                          255, 254, 254, 254),
                                                    ),)
                      
                  ],
                ),
              ).onTap((){
                Get.to(CameraScreen(fromEditProfile: true,));
              }),
            ),



    
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 350,
                width: Get.width / 4.4 ,
                decoration: BoxDecoration(
                              color: Color.fromARGB(255, 5, 161, 125),
                              borderRadius:
                                  BorderRadius.circular(12), // Rounded corners
                            ),
                child: Center(
                  child: Column(
                    children: [
                     80.height,
                      Icon(Icons.card_travel_rounded, size: 135, color: white,),
                      10.height,
                      Text("Chip",  style: rubikMedium.copyWith(
                                                        fontSize: Dimensions
                                                            .fontSizeOverOverLarge,
                                                        color: const Color.fromARGB(
                                                            255, 254, 254, 254),
                                                      ),)
                        
                    ],
                  ),
                ),
              ).onTap((){
                Get.to(verifyWithChip());
              }),
            ),



    
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 350,
                width:Get.width / 4.5 ,
                decoration: BoxDecoration(
                              color: Color.fromARGB(255, 5, 161, 125),
                              borderRadius:
                                  BorderRadius.circular(12), // Rounded corners
                            ),
                child: Column(
                  children: [
                     80.height,
                    Icon(Icons.nfc, size: 135, color: white,),
                    10.height,
                    Text("NFC",  style: rubikMedium.copyWith(
                                                      fontSize: Dimensions
                                                          .fontSizeOverOverLarge,
                                                      color: const Color.fromARGB(
                                                          255, 254, 254, 254),
                                                    ),)
                      
                  ],
                ),
              ).onTap((){
                Get.to(verifyWithNfc());
              }),
            ),





          ],
        ),
      ) );
  }

}



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: KYCVerificationScreen(),
//     );
//   }
// }

// class KYCVerificationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('KYC Verification'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Capture Your Photo for Verification',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(height: 20.0),
//             Container(
//               width: 200.0,
//               height: 200.0,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black,
//                   width: 2.0,
//                 ),
//               ),
//               child: Image.network(
//                 'YourCapturedImageURL', // Display the captured image here
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 RaisedButton(
//                   onPressed: () {
//                     // Retake photo
//                   },
//                   child: Text('Retake'),
//                 ),
//                 SizedBox(width: 20.0),
//                 RaisedButton(
//                   onPressed: () {
//                     // Confirm and send to API
//                   },
//                   child: Text('Confirm'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
