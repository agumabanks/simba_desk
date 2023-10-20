import 'package:flutter/material.dart';

class SimbaMobileScreen extends StatefulWidget {
  const SimbaMobileScreen({super.key});

  @override
  State<SimbaMobileScreen> createState() => _SimbaMobileScreenState();
}

class _SimbaMobileScreenState extends State<SimbaMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:  Text("helllo am simba mobile")
    ));
  }
}