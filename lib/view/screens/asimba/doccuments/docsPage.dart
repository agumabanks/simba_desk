import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:simbadesketop/view/screens/asimba/doccuments/idCard.dart';


class DocumentScre extends StatefulWidget {
  const DocumentScre({Key? key}) : super(key: key);

  @override
  State<DocumentScre> createState() => _DocumentScreState();
} 

class _DocumentScreState extends State<DocumentScre> {
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
            build: (format) => generateCertificate(format,),
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