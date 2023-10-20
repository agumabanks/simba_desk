import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 80.0, // adjust width as needed
            color: Colors.grey[200],
            child: ListView(
              children: [
                // Logo or title
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("SIMBA"),
                ),
                ListTile(
                  title: Icon(Icons.dashboard),
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = 0;
                    });
                  },
                ),
                ListTile(
                  title: Icon(Icons.report),
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = 1;
                    });
                  },
                ),
                ListTile(
                  title: Icon(Icons.person),
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = 2;
                    });
                  },
                ),
                // Add more ListTiles as needed
              ],
            ),
          ),

          // Dynamic content
          Expanded(
            child: Center(
              child: _selectedContent(_selectedTabIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedContent(int index) {
    switch (index) {
      case 0:
        return Text('Dashboard Content');
      case 1:
        return Text('Reports Content');
      case 2:
        return Text('Profiles Content');
      // Add more cases as needed
      default:
        return Text('Content not found');
    }
  }


}
