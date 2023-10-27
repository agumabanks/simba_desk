// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:mime/mime.dart';
// import 'dart:convert';
// import 'dart:io';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: UploadPhotosScreen(),
//     );
//   }
// }

// class UploadPhotosScreen extends StatefulWidget {
//   @override
//   _UploadPhotosScreenState createState() => _UploadPhotosScreenState();
// }

// class _UploadPhotosScreenState extends State<UploadPhotosScreen> {
//   final TextEditingController userIdController = TextEditingController();
//   final ImagePicker _imagePicker = ImagePicker();
//   List<XFile?> images = [null, null, null];

//   Future<void> _uploadImages() async {
    
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     final user_id = prefs.getString('user_id') ?? '';

//     if (user_id.isEmpty || images.contains(null)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please fill in all fields and select images")),
//       );
//       return;
//     }

//     try {
//       final request = http.MultipartRequest(
//         'POST',
//         Uri.parse('http://127.0.0.1:8080/kycphotos2'),
//       );

   
//       request.fields['user_id'] = user_id;

//       for (int i = 0; i < 3; i++) {
//         if (images[i] != null) {
//           final file = File(images[i]!.path);

//           final mimeType = lookupMimeType(file.path);
//           final multipartFile = await http.MultipartFile.fromPath(
//             'image$i', // This should match the field name expected by your backend
//             file.path,
//             contentType: MediaType.parse(mimeType!),
//           );

//           request.files.add(multipartFile);
//         }
//       }

//       final response = await request.send();

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Images uploaded successfully")),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error uploading images. Please try again.")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }

//   Future<void> _selectImage(int index) async {
//     final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         images[index] = pickedFile;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Photos'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: userIdController,
//               decoration: InputDecoration(labelText: 'User ID'),
//             ),
//             SizedBox(height: 16.0),
//             for (int i = 0; i < 3; i++)
//               Column(
//                 children: [
//                   images[i] != null
//                       ? Image.file(
//                           File(images[i]!.path),
//                           height: 100,
//                         )
//                       : Placeholder(),
//                   ElevatedButton(
//                     onPressed: () => _selectImage(i),
//                     child: Text('Select Image $i'),
//                   ),
//                 ],
//               ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _uploadImages,
//               child: Text('Upload Photos'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
