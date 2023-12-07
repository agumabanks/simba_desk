import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:simbadesketop/view/screens/asimba/doccuments/idCard.dart';

class DocumentScre extends StatefulWidget {
  const DocumentScre({super.key});

  @override
  State<DocumentScre> createState() => _DocumentScreState();
}

class _DocumentScreState extends State<DocumentScre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PdfPreview(
                                  maxPageWidth: 700,
                                  allowSharing: false,
                                  canChangePageFormat: false, 
                                  // useActions:false,
                                  build: (format) => generateCertificate(format,),
                                ),);
  }
}