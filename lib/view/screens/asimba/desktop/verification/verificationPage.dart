import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
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
      child: CameraScreen(fromEditProfile: true,)); //VerificationScreen(),);
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     AnimatedContainer(
        //       width: isCapturing ? 250.0 : 200.0,
        //       height: isCapturing ? 250.0 : 200.0,
        //       duration: Duration(milliseconds: 500),
        //       decoration: BoxDecoration(
        //         border: Border.all(
        //           color: isCapturing ? Colors.green : Colors.black,
        //           width: isCapturing ? 4.0 : 2.0,
        //         ),
        //         borderRadius: isCapturing ? BorderRadius.circular(125.0) : BorderRadius.circular(0.0),
        //       ),
        //       child: Center(
        //         child: Text(
        //           isCapturing ? 'Capturing...' : 'Capture Your Face',
        //           style: TextStyle(
        //             fontSize: isCapturing ? 18.0 : 16.0,
        //             color: isCapturing ? Colors.white : Colors.black,
        //           ),
        //         ),
        //       ),
        //     ),
        //     SizedBox(height: 20.0),
            // TextButton(
            //   onPressed: () {
            //     setState(() {
            //       isCapturing = true;
            //       // Add logic to capture the face here
            //     });
            //   },
            //   child: Text('Capture Face'),
        //     ),
        //   ],
        // ),
      // );
  }

  Widget VerificationScreen(){
    return SingleChildScrollView(
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
                  // SizedBox(
                  //   width: 10,
                  //   child:  Container(
                  //   height: double.infinity,
                  //   width: 3,
                  //   color: white,
                  // ),
                  // ),


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
                setState(() {
                  isCapturing = true;
                  // Add logic to capture the face here
                });
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
