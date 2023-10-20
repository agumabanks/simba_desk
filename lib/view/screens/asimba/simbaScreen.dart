import 'package:flutter/material.dart';

class SimbaMainScreen extends StatefulWidget {
  const SimbaMainScreen({super.key});

  @override
  State<SimbaMainScreen> createState() => _SimbaMainScreenState();
}

class _SimbaMainScreenState extends State<SimbaMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text("helllo am simba"),
      ),
    );
  }
}