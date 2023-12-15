
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                
                    // export
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
                          child: Center(child: Text("Export ")),
                        ),).onTap((){
                          // print("view id $ {simbaController.userProfileData['user_id']}");
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
                          // print("view id $ {simbaController.userProfileData['user_id']}");
                        },)
                    ),
                  ],
                ).paddingAll(8),
              ),
      
      ),
    );
  }
}
