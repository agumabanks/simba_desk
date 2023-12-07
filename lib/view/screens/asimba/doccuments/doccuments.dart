import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:printing/printing.dart';
import 'package:simbadesketop/view/screens/asimba/doccuments/docsPage.dart';
import 'package:simbadesketop/view/screens/asimba/doccuments/idCard.dart';

// void main() {
//   runApp(MyApp());
// }

class KYCDocumentsList2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Docs(context);
  }
}

Widget Docs(context){
  return Column(

    children: [
      Row(
            children: [
              const Expanded(
                child: Text('Documents'),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Handle search icon click
                  print('Search icon clicked');
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Handle notifications icon click
                  print('Notifications icon clicked');
                },
              ),
            ],
          ),
       
      Expanded(
        child: SingleChildScrollView(
                child: KYCDocumentsList(),
              ),
      ),
    ],
  );
}

class KYCDocumentsList extends StatelessWidget {
  final List<Map<String, String>> kycDocuments = [
    // Sample data for National ID
    {
      'documentType': 'National ID',
      'documentNumber': '123456789',
      'expiryDate': '2024-12-31',
      'status': 'Approved',
    },
    // Sample data for Employment IDs
    {
      'documentType': 'Employment ID',
      'documentNumber': 'EMP987654',
      'expiryDate': '2023-06-30',
      'status': 'Pending',
    },{
      'documentType': 'Employment ID',
      'documentNumber': 'EMP987654',
      'expiryDate': '2023-06-30',
      'status': 'Pending',
    },{
      'documentType': 'Employment ID',
      'documentNumber': 'EMP987654',
      'expiryDate': '2023-06-30',
      'status': 'Pending',
    },
    // Sample data for Driving Permits
    {
      'documentType': 'Driving Permit',
      'documentNumber': 'DP456789',
      'expiryDate': '2023-09-15',
      'status': 'Rejected',
    },
    // Sample data for Membership Cards
    {
      'documentType': 'Membership Card',
      'documentNumber': 'MEM12345',
      'expiryDate': '2022-11-30',
      'status': 'Approved',
    },
  ];
 
 var  showIds = 0 ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // National ID Section
        KYCSection(
          sectionTitle: 'National ID',
          documents: kycDocuments.where((doc) => doc['documentType'] == 'National ID').toList(),
        ),
        // Employment IDs Section
        KYCSection(
          sectionTitle: 'Employment IDs',
          documents: kycDocuments.where((doc) => doc['documentType'] == 'Employment ID').toList(),
        ),
        // Driving Permits Section
        KYCSection(
          sectionTitle: 'Driving Permits',
          documents: kycDocuments.where((doc) => doc['documentType'] == 'Driving Permit').toList(),
        ),
        // Membership Cards Section
        KYCSection(
          sectionTitle: 'Membership Cards',
          documents: kycDocuments.where((doc) => doc['documentType'] == 'Membership Card').toList(),
        ),

         KYCSection(
          sectionTitle: 'Utillity Bill Cards',
          documents: kycDocuments.where((doc) => doc['documentType'] == 'Membership Card').toList(),
        ),
      ],
    );
  }
}

class KYCSection extends StatelessWidget {
  final String sectionTitle;
  final List<Map<String, String>> documents;

  KYCSection({required this.sectionTitle, required this.documents});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            sectionTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // Document Entries
        Column(
          children: documents.map((document) => KYCDocumentCard(document: document)).toList(),
        ),
      ],
    );
  }
}

class KYCDocumentCard extends StatefulWidget {
  final Map<String, String> document;

  KYCDocumentCard({required this.document});

  @override
  State<KYCDocumentCard> createState() => _KYCDocumentCardState();
}

class _KYCDocumentCardState extends State<KYCDocumentCard> {

  int  _showId = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.document['documentType']!),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Document Number: ${widget.document['documentNumber']}'),
            Text('Expiry Date: ${widget.document['expiryDate']}'),
            Text('Status: ${widget.document['status']}'),
            // _showId == 1 ?
            // Container( child: PdfPreview(
            //                       maxPageWidth: 700,
            //                       allowSharing: false,
            //                       canChangePageFormat: false, 
            //                       // useActions:false,
            //                       build: (format) => generateCertificate(format,),
            //                     )) : SizedBox()
            
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Get.to(DocumentScre());
            // setState(() {
              
            //                                 _showId = 1;
            //                               });
            // setState
            // Handle the button click, e.g., view a larger version of the document.
            print('View Document clicked for ${widget.document['documentType']}');
            print('${_showId}');
          },
          child: Text('View Document'),
        ),
      ),
    );
  }
}
