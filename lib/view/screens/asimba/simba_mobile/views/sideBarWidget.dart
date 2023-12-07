// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:simbadesketop/util/dimensions.dart';
// import 'package:simbadesketop/util/styles.dart';

// class SideMenu extends StatelessWidget {
//   const SideMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//                       width: width / 5.4,
//                       child: Container(
//                         color: const Color(0xFF162231),
//                         padding: const EdgeInsets.fromLTRB(
//                             18, 45, 17, 25), // Sidebar color
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "SIMBA",
//                               textAlign: TextAlign.center,
//                               maxLines: 2,
//                               style: rubikSemiBold.copyWith(
//                                 fontSize: Dimensions.fontSizeOverLarge,
//                                 color: Colors.amber,
//                               ),
//                             ),
                            
                            
//                             Column(
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     TextButton(
//                                       onPressed: () {
//                                        setState(() {
//                                             _selectedTabIndex = 0;
//                                           });
//                                       },
//                                       child: Container(
//                                         margin: const EdgeInsets.fromLTRB(
//                                             10, 0, 0, 0),
//                                         child: Padding(
//                                           padding: const EdgeInsets.fromLTRB(
//                                               20, 10, 20, 10),
//                                           child: Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons.dashboard,
//                                                 color: Color.fromARGB(
//                                                     255, 254, 254, 254),
//                                                 size: 20,
//                                               ),
//                                               const SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 "Dashboard",
//                                                 textAlign: TextAlign.center,
//                                                 maxLines: 2,
//                                                 style: rubikMedium.copyWith(
//                                                   fontSize: Dimensions
//                                                       .fontSizeDefault,
//                                                   color: const Color.fromARGB(
//                                                       255, 254, 254, 254),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         setState(() {
//                                             _selectedTabIndex = 1;
//                                           });
//                                       },
//                                       child: Container(
//                                         margin: const EdgeInsets.fromLTRB(
//                                             10, 0, 0, 0),
//                                         child: Padding(
//                                           padding: const EdgeInsets.fromLTRB(
//                                               20, 10, 20, 10),
//                                           child: Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons.book_outlined,
//                                                 color: Color.fromARGB(
//                                                     255, 122, 131, 125),
//                                                 size: 20,
//                                               ),
//                                               const SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 "Reports",
//                                                 textAlign: TextAlign.center,
//                                                 maxLines: 2,
//                                                 style: rubikMedium.copyWith(
//                                                   fontSize: Dimensions
//                                                       .fontSizeDefault,
//                                                   color: const Color.fromARGB(
//                                                       255, 122, 131, 125),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                          setState(() {
//                                             _selectedTabIndex = 2;
//                                           });
//                                       },
//                                       child: Container(
//                                         margin: const EdgeInsets.fromLTRB(
//                                             10, 0, 0, 0),
//                                         child: Padding(
//                                           padding: const EdgeInsets.fromLTRB(
//                                               20, 10, 20, 10),
//                                           child: Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons.person,
//                                                 color: Color.fromARGB(
//                                                     255, 122, 131, 125),
//                                                 size: 20,
//                                               ),
//                                               const SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 "Profiles",
//                                                 textAlign: TextAlign.center,
//                                                 maxLines: 2,
//                                                 style: rubikMedium.copyWith(
//                                                   fontSize: Dimensions
//                                                       .fontSizeDefault,
//                                                   color: const Color.fromARGB(
//                                                       255, 122, 131, 125),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),

//                                     TextButton(
//                                       onPressed: () {
//                                          setState(() {
//                                             _selectedTabIndex = 3;
//                                           });
//                                       },
//                                       child: Container(
//                                         margin: const EdgeInsets.fromLTRB(
//                                             10, 0, 0, 0),
//                                         child: Padding(
//                                           padding: const EdgeInsets.fromLTRB(
//                                               20, 10, 20, 10),
//                                           child: Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons.account_balance,
//                                                 color: Color.fromARGB(
//                                                     255, 122, 131, 125),
//                                                 size: 20,
//                                               ),
//                                               const SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 "Verifications",
//                                                 textAlign: TextAlign.center,
//                                                 maxLines: 2,
//                                                 style: rubikMedium.copyWith(
//                                                   fontSize: Dimensions
//                                                       .fontSizeDefault,
//                                                   color: const Color.fromARGB(
//                                                       255, 122, 131, 125),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),

//                                     TextButton(
//                                       onPressed: () {
//                                         setState(() {
//                                             _selectedTabIndex = 4;
//                                           });
//                                       },
//                                       child: Container(
//                                         margin: const EdgeInsets.fromLTRB(
//                                             10, 0, 0, 0),
//                                         child: Padding(
//                                           padding: const EdgeInsets.fromLTRB(
//                                               20, 10, 20, 10),
//                                           child: Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons.book,
//                                                 color: Color.fromARGB(
//                                                     255, 122, 131, 125),
//                                                 size: 20,
//                                               ),
//                                               const SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 "Doccuments",
//                                                 textAlign: TextAlign.center,
//                                                 maxLines: 2,
//                                                 style: rubikMedium.copyWith(
//                                                   fontSize: Dimensions
//                                                       .fontSizeDefault,
//                                                   color: const Color.fromARGB(
//                                                       255, 122, 131, 125),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),

//                                     TextButton(
//                                       onPressed: () {
//                                         setState(() {
//                                             _selectedTabIndex = 5;
//                                           });
//                                       },
//                                       child: Container(
//                                         margin: const EdgeInsets.fromLTRB(
//                                             10, 0, 0, 0),
//                                         child: Padding(
//                                           padding: const EdgeInsets.fromLTRB(
//                                               20, 10, 20, 10),
//                                           child: Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons.format_align_center,
//                                                 color: Color.fromARGB(
//                                                     255, 122, 131, 125),
//                                                 size: 20,
//                                               ),
//                                               const SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 "Registration",
//                                                 textAlign: TextAlign.center,
//                                                 maxLines: 2,
//                                                 style: rubikMedium.copyWith(
//                                                   fontSize: Dimensions
//                                                       .fontSizeDefault,
//                                                   color: const Color.fromARGB(
//                                                       255, 122, 131, 125),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 50, 10, 20),
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         width: double.infinity,
//                                         height: 1,
//                                         decoration: BoxDecoration(
//                                           color: const Color.fromARGB(
//                                               131, 122, 131, 125),
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                           border: const Border(),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets.fromLTRB(
//                                             6, 0, 0, 0),
//                                         child: Padding(
//                                           padding: const EdgeInsets.fromLTRB(
//                                               15, 10, 20, 10),
//                                           child: TextButton(
//                                             onPressed: () {
//                                              setState(() {
//                                                   _selectedTabIndex = 6;
//                                                 });
//                                             },
//                                             child: Row(
//                                               children: [
//                                                 const Icon(
//                                                   Icons
//                                                       .settings_ethernet_rounded,
//                                                   color: Color.fromRGBO(122, 131, 125, 1),
//                                                   size: 20,
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 10,
//                                                 ),
//                                                 Text(
//                                                   "Settings",
//                                                   textAlign: TextAlign.center,
//                                                   maxLines: 2,
//                                                   style: rubikMedium.copyWith(
//                                                     fontSize: Dimensions
//                                                         .fontSizeDefault,
//                                                     color: const Color.fromARGB(
//                                                         255, 122, 131, 125),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: double.infinity,
//                                     height: 1,
//                                     decoration: BoxDecoration(
//                                       color: const Color.fromARGB(
//                                           131, 122, 131, 125),
//                                       borderRadius: BorderRadius.circular(12),
//                                       border: const Border(
//                                           // top: BorderSide(
//                                           //   color: Colors.red,
//                                           //   width: 4.0,  // Width of the border
//                                           // ),
//                                           ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   Center(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         // Profile Photo
//                                         Container(
//                                           width: 40,
//                                           height: 40,
//                                           decoration: const BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             image: DecorationImage(
//                                               image: NetworkImage(
//                                                   'https://www.pixels.ng/wp-content/uploads/2022/02/DSC_2846.jpg'),
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width:
//                                               16, // Space between photo and text
//                                         ),
//                                         // Name and Email
//                                         const Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               'John Doe',
//                                               style: TextStyle(
//                                                 color: Color.fromARGB(
//                                                     255, 115, 129, 119),
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             Text(
//                                               'john.doe@sanaa.co',
//                                               style: TextStyle(
//                                                 fontSize: 12,
//                                                 color: Color.fromARGB(
//                                                     255, 122, 131, 125),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ]),
//                           ],
//                         ),
//                       ),
//                     );
//   }
// }