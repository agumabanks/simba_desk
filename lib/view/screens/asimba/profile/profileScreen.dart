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
                child: ProfileDataScreen(simbaController: simbaController,)
                
                
                
                // OldprofileScreen(),
              ),
            ),
          ),
          Positioned(
            top: 40, // Adjust this value to your preferred top position
            left: 10, // Adjust this value to your preferred left position
            child: Container(
              height: 50,
              width:50,
               decoration: BoxDecoration(
                color:  Colors.grey.withOpacity(0.4),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.4),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(Icons.arrow_back),
                ),
                onPressed: () {
                  simbaController.resetUserDetails();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
      
      
      
      
      
      );
    
  }

  Column OldprofileScreen() {
    return Column(
                children: [

                  // Display user details
                  // Text('User Name: ${simbaController.userProfileData['phone_number']}'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                    Container(
                      height: Get.height /2.3,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 231, 231, 231),
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                      width: double.infinity,
                  
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           
                        
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                   10.width,
                                  ProfilePhoto(simbaController: simbaController),
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
                                  child: SingleChildScrollView(
                                    child: Column(
                                                              
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      50.height,
                                       
                                      ProfileData("", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),
                                                              
                                      10.height,ProfileData("Job:", '${simbaController.userProfileData['current_job_title']} '),
                                                              
                                      10.height,ProfileData("email:", '${simbaController.userProfileData['email']}   '),
                                                              
                                        10.height,ProfileData("driving_license:", '${simbaController.userProfileData['driving_license']}   '),
                                         10.height,ProfileData("gender:", '${simbaController.userProfileData['gender']}   '),
                                         10.height,ProfileData("blood type:", '${simbaController.userProfileData['blood_type']}   '),
                                          10.height,ProfileData("criminal record:", '${simbaController.userProfileData['criminal_record']}   '),
                                        
                                      ],
                                    ),
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
                                  child: SingleChildScrollView(
                                    child: Column(
                                                              
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      50.height,
                                       
                                       ProfileData("emergency_contact_name", '${simbaController.userProfileData['emergency_contact_name']}'),10.height,
                                       ProfileData("mothers name", '${simbaController.userProfileData['mothers_name']}'),10.height,
                                       ProfileData("fathers name", '${simbaController.userProfileData['fathers_name']}'),10.height,
                                       ProfileData("Next Of Kin Tel", '${simbaController.userProfileData['emergency_contact_phone']}'),10.height,
                                       ProfileData("Next Of Kin Relation", '${simbaController.userProfileData['emergency_contact_relationship']}'),10.height,
                                       ProfileData("employment Status", '${simbaController.userProfileData['employment_status']}'),10.height,
                                       ProfileData("marital_status", '${simbaController.userProfileData['marital_status']}'),10.height,
                                      
                                        
                                      ],
                                    ),
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
                                  child: SingleChildScrollView(
                                    child: Column(
                                                              
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      50.height,
                                       
                                       ProfileData("spouse name", '${simbaController.userProfileData['emergency_contact_name']}'),10.height,
                                       ProfileData("residential address", '${simbaController.userProfileData['residential_address']}'),10.height,
                                       ProfileData("place of birth", '${simbaController.userProfileData['place_of_birth']}'),10.height,
                                       ProfileData("Tel", '${simbaController.userProfileData['phone_number']}'),10.height,
                                       ProfileData("passport number", '${simbaController.userProfileData['passport_number']}'),10.height,
                                       ProfileData("nationality", '${simbaController.userProfileData['nationality']}'),10.height,
                                       ProfileData("nationality", '${simbaController.userProfileData['nationality']}'),10.height,
                                      
                                        
                                      ],
                                    ),
                                  ),
                                  
                        
                                 
                              ),
                            ),
                          
                          const ProfileActions()
                          
                          ],
                        ),
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
                                height: 250,width: 200,
                                 decoration: BoxDecoration(
                                  color: Colors.amber,
                                   borderRadius:
                                      BorderRadius.circular(12), // Rounded corners
                                ),
                              ),
                            ),
                            // Text('registration_date: ${simbaController.userProfileData['registration_date']}'),
                           
                           Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                height: double.infinity,
                                width: 200,
                                decoration: BoxDecoration(
                                   borderRadius:
                                      BorderRadius.circular(12), // Rounded corners
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                  
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    50.height,
                                     
                                    ProfileData("", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),
                                  
                                    10.height,ProfileData("Job:", '${simbaController.userProfileData['current_job_title']} '),
                                  
                                    10.height,ProfileData("email:", '${simbaController.userProfileData['email']}   '),
                                  
                                      10.height,ProfileData("driving_license:", '${simbaController.userProfileData['driving_license']}   '),
                                       10.height,ProfileData("gender:", '${simbaController.userProfileData['gender']}   '),
                                       10.height,ProfileData("blood type:", '${simbaController.userProfileData['blood_type']}   '),
                                        10.height,ProfileData("criminal record:", '${simbaController.userProfileData['criminal_record']}   '),
                                      
                                    ],
                                  ),
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
                                child: SingleChildScrollView(
                                  child: Column(
                                  
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    50.height,
                                     
                                    ProfileData("", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),
                                  
                                    10.height,ProfileData("Job:", '${simbaController.userProfileData['current_job_title']} '),
                                  
                                    10.height,ProfileData("email:", '${simbaController.userProfileData['email']}   '),
                                  
                                      10.height,ProfileData("driving_license:", '${simbaController.userProfileData['driving_license']}   '),
                                       10.height,ProfileData("gender:", '${simbaController.userProfileData['gender']}   '),
                                       10.height,ProfileData("blood type:", '${simbaController.userProfileData['blood_type']}   '),
                                        10.height,ProfileData("criminal record:", '${simbaController.userProfileData['criminal_record']}   '),
                                      
                                    ],
                                  ),
                                ),
                                

                               
                            ),
                          ),Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                height: double.infinity,
                                width: 200,
                                decoration: BoxDecoration(
                                   borderRadius:
                                      BorderRadius.circular(12), // Rounded corners
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                  
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    50.height,
                                     
                                    ProfileData("", '${simbaController.userProfileData['first_name']}   ${simbaController.userProfileData['last_name']}'),
                                  
                                    10.height,ProfileData("Job:", '${simbaController.userProfileData['current_job_title']} '),
                                  
                                    10.height,ProfileData("email:", '${simbaController.userProfileData['email']}   '),
                                  
                                      10.height,ProfileData("driving_license:", '${simbaController.userProfileData['driving_license']}   '),
                                       10.height,ProfileData("gender:", '${simbaController.userProfileData['gender']}   '),
                                      10.height,ProfileData("registed", '${simbaController.userProfileData['registration_date']}   '),
                                                                 10.height,ProfileData("dob", '${simbaController.userProfileData['dob']}   '),
                                                                
                                    ],
                                  ),
                                ),
                                

                               
                            ),
                          ),
                            
                          ],
                        ),
                      )),
                      
                    ),
                  // Add more details as needed
                ],
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



class ProfileDataScreen extends StatelessWidget {
  const ProfileDataScreen({
    super.key,
    required this.simbaController,
  });

  final SimbaDesktopController simbaController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 20,
      width: Get.width - 20,
      decoration:  BoxDecoration(
          // image:DecorationImage(
          //   image: NetworkImage('${AppConstants.mainUrls}imagefile?path=${simbaController.userProfileData['front_photo_url']}',)),
          color: const Color.fromARGB(255, 231, 231, 231),
          borderRadius:
              BorderRadius.circular(12), // Rounded corners
        ),


        child: Row(
          children: [
             Container(
              height: Get.height,
              width: Get.width / 4,
              child: ProfilePhoto(simbaController: simbaController)),
          ],
        ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    required this.simbaController,
  });

  final SimbaDesktopController simbaController;

  @override
  Widget build(BuildContext context) {
    return Container(
                                
        height: 250,
        width: 200,
        decoration: BoxDecoration(
          image:DecorationImage(image: NetworkImage('${AppConstants.mainUrls}imagefile?path=${simbaController.userProfileData['front_photo_url']}',)),
          color: Color.fromARGB(255, 253, 253, 253),
          borderRadius:
              BorderRadius.circular(12), // Rounded corners
        ),
       
    
       
    );
  }
}
