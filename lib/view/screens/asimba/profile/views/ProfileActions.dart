
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simbadesketop/controller/simba/simbaDesktopContllor.dart';
import 'package:simbadesketop/helper/route_helper.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/profilesScreen.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/verification/views/verifyWithNfc.dart';
import 'package:simbadesketop/view/screens/asimba/doccuments/docsPage.dart';
import 'package:simbadesketop/view/screens/asimba/profile/generateIdCard.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
      final SimbaDesktopController simbaController = Get.put(SimbaDesktopController(simbaRepo: Get.find(), sharedPreferences: Get.find()));

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 200,
        height: double.infinity,
        decoration: BoxDecoration(
                 borderRadius:
                    BorderRadius.circular(12), 
                    color: white// Rounded corners
              ),
    
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Action"),
                    5.height,
                    Divider(height: 3,color: gray,),
                    // ElevatedButton(onPressed: (){}, child: Text("View ID"))
                    // 10.height,
                
                
                    // view
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                       decoration: BoxDecoration(
                      borderRadius:
                        BorderRadius.circular(7), 
                        color: Colors.black12// Rounded corners
                        ),
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(child: Text("View ID ")),
                        ),).onTap((){
                          // print("view id $ {simbaController.userProfileData['user_id']}");
                           Get.to(IdScreen());
                            // print('View Document clicked for ${widget.document['documentType']}');
                            // print('${_showId}');
                        },)
                    ),
                
                    // Edit
                     Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                       decoration: BoxDecoration(
                      borderRadius:
                        BorderRadius.circular(7), 
                        color: Colors.black12// Rounded corners
                        ),
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(child: Text("Edit ")),
                        ),).onTap((){
                          // print("view id $ {simbaController.userProfileData['user_id']}");
                        },)
                    ),
                
                    // suspend
                    //  Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 40,
                    //    decoration: BoxDecoration(
                    //   borderRadius:
                    //     BorderRadius.circular(7), 
                    //     color: Colors.black12// Rounded corners
                    //     ),
                    //     child:  const Padding(
                    //       padding: EdgeInsets.symmetric(vertical: 10),
                    //       child: Center(child: Text("Suspend")),
                    //     ),).onTap((){
                    //       // print("view id $ {simbaController.userProfileData['user_id']}");
                    //     },)
                    // ),
                
                    // approve
                     Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                       decoration: BoxDecoration(
                      borderRadius:
                        BorderRadius.circular(7), 
                        color: Colors.black12// Rounded corners
                        ),
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(child: Text("Approve")),
                        ),).onTap((){
                          // print("view id $ {simbaController.userProfileData['user_id']}");
                        },)
                    ),
                
                    // NFC
                     Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                       decoration: BoxDecoration(
                      borderRadius:
                        BorderRadius.circular(7), 
                        color: Colors.black12// Rounded corners
                        ),
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(child: Text("Add NFC ")),
                        ),).onTap((){
                          // print("view id $ {simbaController.userProfileData['user_id']}");
                          Get.to(verifyWithNfc());
                        },)
                    ),
                
                    // delete
                     Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                       decoration: BoxDecoration(
                      borderRadius:
                        BorderRadius.circular(7), 
                        color: Colors.black12// Rounded corners
                        ),
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(child: Text("Delete ")),
                        ),).onTap((){
                          // print("view id $ {simbaController.userProfileData['user_id']}"); ${simbaController.userProfileData['first_name']}
                           simbaController.deletProfile('${simbaController.userProfileData['user_id']}');
                          //  Get.to(() => ProfilesScreen());
                          Get.offNamed(RouteHelper.getMobileHome());
                        },)
                    ),
                  ],
                ).paddingAll(8),
              ),
      
      ),
    );
  }
}
