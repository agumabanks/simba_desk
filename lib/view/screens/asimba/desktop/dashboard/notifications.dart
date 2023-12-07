import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simbadesketop/util/styles.dart';

class DashboardNotification extends StatefulWidget {
  const DashboardNotification({super.key});

  @override
  State<DashboardNotification> createState() => _DashboardNotificationState();
}

class _DashboardNotificationState extends State<DashboardNotification> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Text("Individual Cases",
                textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 15,
                            color:black,
                   )
                ),
                
                Row(
                  children: [
                    Text("View all",
                    textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 15,
                            color:black,
                   )),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ],
            ),

            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
                 Text("Individual Cases",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: textColorLight ,
                   )
                ),

                
                Text("Created",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: textColorLight ,
                   )
                ),
                Text("Doccuments",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: textColorLight ,
                   )
                ),
                
                Text("Status",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: textColorLight ,
                   )
                ),
                // 10.height,

                Text("Action",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: textColorLight ,
                   )
                ),

                // 20.width
              ],
            ),
                          5.height,
                          const Divider(height: 2,color:textColorLight),
                          7.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
                 Text("Aguma B.",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: black ,
                   )
                ),

                
                Text("2 hrs",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: black ,
                   )
                ),
                Text("NIN",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: black ,
                   )
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                                  color:  greenColor,
                                  borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text("Pass",
                         textAlign: TextAlign.center, maxLines: 2,
                           style: rubikMedium.copyWith(
                                  fontSize: 10,
                                    color: black ,
                           )
                        ),
                      ),
                    ),
                  ),
                ),

                // 20.width,

                Icon(Icons.more_horiz_outlined),
              ],
            ),
             7.height,

             const Divider(height: 2,color:textColorLight),
                          7.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
                 Text("Aguma B.",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: black ,
                   )
                ),

                
                Text("2 hrs",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: black ,
                   )
                ),
                Text("NIN",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: black ,
                   )
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                                  color:  greenColor,
                                  borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text("Pass",
                         textAlign: TextAlign.center, maxLines: 2,
                           style: rubikMedium.copyWith(
                                  fontSize: 10,
                                    color: black ,
                           )
                        ),
                      ),
                    ),
                  ),
                ),

                // 20.width,

                Icon(Icons.more_horiz_outlined),
              ],
            ),
             7.height,const Divider(height: 2,color:textColorLight),
                          7.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
                 Text("Aguma B.",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: black ,
                   )
                ),

                
                Text("2 hrs",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: black ,
                   )
                ),
                Text("NIN",
                 textAlign: TextAlign.center, maxLines: 2,
                   style: rubikMedium.copyWith(
                          fontSize: 12,
                            color: black ,
                   )
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                                  color:  greenColor,
                                  borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text("Pass",
                         textAlign: TextAlign.center, maxLines: 2,
                           style: rubikMedium.copyWith(
                                  fontSize: 10,
                                    color: black ,
                           )
                        ),
                      ),
                    ),
                  ),
                ),

                // 20.width,

                Icon(Icons.more_horiz_outlined),
              ],
            ),
             7.height,
            

            

            


            

          ],
        ),
      ),
      );
  }
}