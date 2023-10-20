import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbadesketop/controller/simba/simbaDesktopContllor.dart';

class SimbaDashboardScreen extends StatefulWidget {
  const SimbaDashboardScreen({super.key});

  @override
  State<SimbaDashboardScreen> createState() => _SimbaDashboardScreenState();
}

class _SimbaDashboardScreenState extends State<SimbaDashboardScreen> {
  Future<void> _loadData(BuildContext context, bool reload) async {
    if(reload){
      Get.find<SimbaDesktopController>().getProfilesList();
    }
   Get.find<SimbaDesktopController>().getProfilesList();


  }


  @override
  void initState() {

   Get.find<SimbaDesktopController>().getProfilesList();
  //  Get.find<SimbaDesktopController>().getProfilesList();
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    // return 
    final width = Get.width;
    final height = Get.height;
  

    return GetBuilder<SimbaDesktopController>(builder: (simbaDesktopController){
      return simbaDesktopController.profilesList == null ? const Scaffold(
      body: Center(
        child:  Text("its empty")
      ))  :
      
      Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: simbaDesktopController.profilesList!.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(simbaDesktopController.profilesList![index].userId.toString()),
                subtitle: Text(simbaDesktopController.profilesList![index].username.toString()),
              );}
      ))); 
    }); 
    
  }
}










