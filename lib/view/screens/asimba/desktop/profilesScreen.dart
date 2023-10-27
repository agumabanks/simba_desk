import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simbadesketop/controller/simba/simbaDesktopContllor.dart';

class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({super.key});

  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  
   Future<void> _loadData(BuildContext context, bool reload) async {
    if (reload) {
      Get.find<SimbaDesktopController>().getProfilesList();
    }
    Get.find<SimbaDesktopController>().getProfilesList();
  }

  @override
  void initState() {
    Get.find<SimbaDesktopController>().getProfilesList();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SimbaDesktopController>(
            builder: (simbaDesktopController) {
          return simbaDesktopController.profilesList == null
              ? const Scaffold(body: Center(child: Text("its empty")))
              : Container(
                  color: const Color(0xFF162231), // Main area color
                  child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(18),
                        margin: const EdgeInsets.fromLTRB(20, 25, 25, 20),
                        // color: Colors.white,

                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 213, 213, 213),
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,),
                          itemCount:simbaDesktopController.profilesList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(

                                 decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 213, 213, 213),
                                  borderRadius:
                                      BorderRadius.circular(12), // Rounded corners
                                ),
                                child: Stack(
                                    children: [
                                      Container(
                                        height: 500,
                                        width: 250,
                                        color: Colors.white, // Set the background color to white
                                      ),
                                      Positioned(
                                        top: 5,
                                        left: 5,
                                        right: 5,
                                        bottom: 5,
                                        child: Image.network(
                                          'http://localhost:8080/imagefile?path=${simbaDesktopController.profilesList![index].frontPhotoUrl}',
                                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress.expectedTotalBytes != null
                                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                            return Text('Image not found');
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        left: 5,
                                        right: 5,
                              
                                        child: Center(
                                          child: Container(
                                            height: 50,
                                            width: double.infinity,
                                            color: whiteColor,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                // Your Text Widgets here
                                                Text("${simbaDesktopController.profilesList![index].username}"),
                                                Text("${simbaDesktopController.profilesList![index].phoneNumber}")
                                                                              
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                            );
                          },
                        )),
                  ),
                );
        });

     
  }
}