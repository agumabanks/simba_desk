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

// class KYCVerificationScreen extends StatefulWidget {
//   @override
//   _KYCVerificationScreenState createState() => _KYCVerificationScreenState();
// }

// class _KYCVerificationScreenState extends State<KYCVerificationScreen> {
//   bool isCapturing = false;

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
//             AnimatedContainer(
//               width: isCapturing ? 250.0 : 200.0,
//               height: isCapturing ? 250.0 : 200.0,
//               duration: Duration(milliseconds: 500),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: isCapturing ? Colors.green : Colors.black,
//                   width: isCapturing ? 4.0 : 2.0,
//                 ),
//                 borderRadius: isCapturing ? BorderRadius.circular(125.0) : BorderRadius.circular(0.0),
//               ),
//               child: Center(
//                 child: Text(
//                   isCapturing ? 'Capturing...' : 'Capture Your Face',
//                   style: TextStyle(
//                     fontSize: isCapturing ? 18.0 : 16.0,
//                     color: isCapturing ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             RaisedButton(
//               onPressed: () {
//                 setState(() {
//                   isCapturing = true;
//                   // Add logic to capture the face here
//                 });
//               },
//               child: Text('Capture Face'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
