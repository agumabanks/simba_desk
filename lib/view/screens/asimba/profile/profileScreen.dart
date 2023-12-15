import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simbadesketop/controller/simba/simbaDesktopContllor.dart';
import 'package:simbadesketop/util/app_constants.dart';
import 'package:simbadesketop/util/dimensions.dart';
import 'package:simbadesketop/util/styles.dart';
import 'package:simbadesketop/view/screens/asimba/profile/views/ProfileActions.dart';



class KycProfileScreen2 extends StatefulWidget {
  @override
  State<KycProfileScreen2> createState() => _KycProfileScreen2State();
}

class _KycProfileScreen2State extends State<KycProfileScreen2> {
  final Map<String, dynamic> profileData = {
    "user_id": "26e31863-95e5-11ee-908d-b6322f66a06e",
    "blood_type": "",
    "created_at": "0001-01-01T00:00:00Z",
    "criminal_record": false,
    "current_employer": "",
    // ... (the rest of the profile data)
  };

  final SimbaDesktopController simbaController = Get.put(SimbaDesktopController(simbaRepo: Get.find(), sharedPreferences: Get.find()));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('User Profile'),
      // ),
      body:  Stack(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 10, 10),
              // ignore: avoid_unnecessary_containers
              child: Container(
                height: Get.height,
                width: Get.width,
              // Your details screen UI goes here
              child: Center(
                child: Column(
                  children: [

                    // Display user details
                    // Text('User Name: ${simbaController.userProfileData['phone_number']}'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: Get.height /2.3,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 231, 231),
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                        width: double.infinity,
                    
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                   10.width,
                                  Container(
                                                              
                                      height: 250,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        image:DecorationImage(image: NetworkImage('${AppConstants.mainUrls}imagefile?path=${simbaController.userProfileData['front_photo_url']}',)),
                                        color: Color.fromARGB(255, 253, 253, 253),
                                        borderRadius:
                                            BorderRadius.circular(12), // Rounded corners
                                      ),
                                     
                                  
                                     
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  height: double.infinity,
                                  width: 200,
                                  decoration: BoxDecoration(
                                     borderRadius:
                                        BorderRadius.circular(12), // Rounded corners
                                  ),
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    50.height,
                                     
                                    ProfileData("", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Job", '${simbaController.userProfileData['current_job_title']} '),

                                    10.height,ProfileData("email", '${simbaController.userProfileData['email']}   '),

                                      10.height,ProfileData("driving_license", '${simbaController.userProfileData['driving_license']}   '),
                                       10.height,ProfileData("gender", '${simbaController.userProfileData['gender']}   '),
                                       10.height,ProfileData("blood type", '${simbaController.userProfileData['blood_type']}   '),
                                        10.height,ProfileData("email", '${simbaController.userProfileData['email']}   '),
                                      
                                    ],
                                  ),
                                  

                                 
                              ),
                            ),
                            
                            
                             Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  height: double.infinity,
                                  width: 200,
                                  decoration: BoxDecoration(
                                     borderRadius:
                                        BorderRadius.circular(12), // Rounded corners
                                  ),
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    50.height,
                                     
                                    ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                      
                                    ],
                                  ),
                                  

                                 
                              ),
                            ),

                             Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  height: double.infinity,
                                  width: 200,
                                  decoration: BoxDecoration(
                                     borderRadius:
                                        BorderRadius.circular(12), // Rounded corners
                                  ),
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    50.height,
                                     
                                    ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                    10.height,ProfileData("Name", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),

                                      
                                    ],
                                  ),
                                  

                                 
                              ),
                            ),
                          
                          const ProfileActions()
                          
                          ],
                        )),
                    ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 231, 231),
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                        height: Get.height /2.3,
                        width: double.infinity,
                      
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 250,width: 200,color: Colors.amber,
                                ),
                              ),
                              Text('Email: ${simbaController.userProfileData['email']}'),
                             
                               10.height,ProfileData("dob", '${simbaController.userProfileData['dob']}   '),
                              
                            ],
                          ),
                        )),
                        
                      ),
                    // Add more details as needed
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40, // Adjust this value to your preferred top position
            left: 10, // Adjust this value to your preferred left position
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                simbaController.resetUserDetails();
                // Navigate back when the back button is pressed
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      
      
      
      
      
      );
    
  }

                            Widget ProfileData(String? name, String title){
                                       return  Padding(
                                         padding: const EdgeInsets.all(0),
                                         child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text( "$name    ",
                                            textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: rubikMedium.copyWith(
                                                  fontSize: Dimensions.fontSizeDefault,
                                                  color: const Color.fromARGB(255, 79, 78, 78),
                                                ),
                                            ),
                                         
                                            Text(title,
                                            textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: rubikMedium.copyWith(
                                                  fontSize: 16,
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                ),
                                            ),
                                         
                                            
                                          ],
                                                                               ),
                                       );
 }
}
