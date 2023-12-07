import 'package:flutter/material.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/simbaDesktop.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/simbaMobile.dart';

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
        child:  SimbaMobScreen()//SimbaDesktopScreen()
    ));
  }
}