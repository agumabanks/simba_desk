import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('KYC Reports'),
//         ),
//         body: ReportsList(),
//       ),
//     );
//   }
// }

class ReportsList extends StatelessWidget {
  final List<Map<String, String>> reportsSections = [
    {
      'name': 'Verification Summary',
      'description': 'Overview of the total number of customer verifications conducted.',
    },
    {
      'name': 'Customer Activity Reports',
      'description': 'History of customer interactions and updates to their profiles.',
    },
    {
      'name': 'Document Verification Reports',
      'description': 'Details on document types submitted by customers.',
    },
    {
      'name': 'Alerts and Notifications',
      'description': 'Information on any alerts triggered during the KYC process.',
    },
    {
      'name': 'Compliance Reports',
      'description': 'Summaries of compliance checks against regulatory requirements.',
    },
    {
      'name': 'Audit Trail',
      'description': 'A detailed log of all actions performed within the KYC system by administrators.',
    },
    {
      'name': 'Geographical Analysis',
      'description': 'Geographic distribution of customers and analysis of KYC success rates in different regions.',
    },
    {
      'name': 'Performance Metrics',
      'description': 'System performance metrics, such as response times and uptime.',
    },
    {
      'name': 'Data Quality Reports',
      'description': 'Assessment of the quality of customer data.',
    },
    {
      'name': 'User Access and Permissions',
      'description': 'Reports on user access levels and permissions.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reportsSections.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(reportsSections[index]['name']!),
            subtitle: Text(reportsSections[index]['description']!),
            trailing: ElevatedButton(
              onPressed: () {
                // Handle the button click here, e.g., navigate to a detailed view.
                print('View More clicked for ${reportsSections[index]['name']}');
              },
              child: Text('View More'),
            ),
          ),
        );
      },
    );
  }
}
