import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:simbadesketop/view/screens/asimba/doccuments/idCard.dart';
import 'package:simbadesketop/view/screens/asimba/profile/profileIdCard.dart';


class IdScreen extends StatefulWidget {
  const IdScreen({Key? key}) : super(key: key);

  @override
  State<IdScreen> createState() => _IdScreenState();
} 

class _IdScreenState extends State<IdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PdfPreview(
            maxPageWidth: 700,
            allowSharing: false,
            canChangePageFormat: false,
            // useActions:false,
            build: (format) => generateIdCard(format,),
          ),
          Positioned(
            top: 40, // Adjust this value to your preferred top position
            left: 10, // Adjust this value to your preferred left position
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Navigate back when the back button is pressed
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}