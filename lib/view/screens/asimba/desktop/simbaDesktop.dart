import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:printing/printing.dart';
import 'package:simbadesketop/controller/auth_controller.dart';
import 'package:simbadesketop/controller/localization_controller.dart';
import 'package:simbadesketop/controller/simba/simbaDesktopContllor.dart';
import 'package:simbadesketop/controller/simba/txt.dart';
import 'package:simbadesketop/data/model/simbaProfile.dart';
import 'package:simbadesketop/helper/phone_cheker.dart';
import 'package:simbadesketop/helper/route_helper.dart';
import 'package:simbadesketop/util/dimensions.dart';
import 'package:simbadesketop/util/images.dart';
import 'package:simbadesketop/util/styles.dart';
import 'package:simbadesketop/view/base/custom_ink_well.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/custom_text_field.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/profilesScreen.dart';
import 'package:simbadesketop/view/screens/asimba/doccuments/idCard.dart';
// import 'package:simbadesketop/view/base/custom_text_field.dart';
import 'package:simbadesketop/view/screens/profile/widget/menu_item.dart';
import 'package:simbadesketop/view/screens/profile/widget/menu_item.dart';

import '../../../../helper/responsive_helper.dart';
import '../../requested_money/widget/custom_button.dart';


import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';


import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'dart:convert';
import 'dart:io';


class SimbaDesktopScreen extends StatefulWidget {
  const SimbaDesktopScreen({super.key});

  @override
  State<SimbaDesktopScreen> createState() => _SimbaDesktopScreenState();
}

class _SimbaDesktopScreenState extends State<SimbaDesktopScreen> {
  Future<void> _loadData(BuildContext context, bool reload) async {
    if (reload) {
      Get.find<SimbaDesktopController>().getProfilesList();
    }
    Get.find<SimbaDesktopController>().getProfilesList();
  }

  @override
  void initState() {
    Get.find<SimbaDesktopController>().getProfilesList();
    //  Get.find<SimbaDesktopController>().getProfilesList();
    // final userId = storage.read('user_id');
    super.initState();
  }

  int _selectedTabIndex = 0;
  int _selectedStepIndex = 0;


  final FocusNode _user_idFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _first_nameFocus = FocusNode();
  final FocusNode _middle_nameFocus = FocusNode();
  final FocusNode _last_nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phone_numbeFocus = FocusNode();
  final FocusNode _dobFocus = FocusNode();
  final FocusNode _place_of_birthFocus = FocusNode();
  final FocusNode _genderFocus = FocusNode();
  final FocusNode _nationalityFocus = FocusNode();
  final FocusNode _marital_statusFocus = FocusNode();
  final FocusNode _spouse_nameFocus = FocusNode();

// controllers

  final TextEditingController _username = TextEditingController();
  final TextEditingController _first_name = TextEditingController();
  final TextEditingController _middle_name = TextEditingController();
  final TextEditingController _last_name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone_number = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _place_of_birth = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _nationality = TextEditingController();
  final TextEditingController _marital_status = TextEditingController();
  final TextEditingController _spouse_name = TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final FocusNode _referCodeFocus = FocusNode();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _referCodeController = TextEditingController();
  String? _countryDialCode;


  final userIdStored =  GetStorage().read('user_id');

  


  @override
  Widget build(BuildContext context) {
    // return
    final width = Get.width;
    final height = Get.height;

    return GetBuilder<SimbaDesktopController>(
        builder: (simbaDesktopController) {
      return simbaDesktopController.profilesList == null
          ? const Scaffold(body: Center(child: Text("its empty")))
          : Scaffold(
              body: Container(
              height: height,
              width: width, //162231
              color: const Color(0xFF162231),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width / 5.4,
                      child: Container(
                        color: const Color(0xFF162231),
                        padding: const EdgeInsets.fromLTRB(
                            25, 45, 25, 25), // Sidebar color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SIMBA",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: rubikSemiBold.copyWith(
                                fontSize: Dimensions.fontSizeOverLarge,
                                color: Colors.amber,
                              ),
                            ),
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                       setState(() {
                                            _selectedTabIndex = 0;
                                          });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.dashboard,
                                                color: Color.fromARGB(
                                                    255, 254, 254, 254),
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Dashboard",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: rubikMedium.copyWith(
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  color: const Color.fromARGB(
                                                      255, 254, 254, 254),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                            _selectedTabIndex = 1;
                                          });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.book_outlined,
                                                color: Color.fromARGB(
                                                    255, 122, 131, 125),
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Reports",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: rubikMedium.copyWith(
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  color: const Color.fromARGB(
                                                      255, 122, 131, 125),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                         setState(() {
                                            _selectedTabIndex = 2;
                                          });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.person,
                                                color: Color.fromARGB(
                                                    255, 122, 131, 125),
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Profiles",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: rubikMedium.copyWith(
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  color: const Color.fromARGB(
                                                      255, 122, 131, 125),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    TextButton(
                                      onPressed: () {
                                         setState(() {
                                            _selectedTabIndex = 3;
                                          });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.account_balance,
                                                color: Color.fromARGB(
                                                    255, 122, 131, 125),
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Verifications",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: rubikMedium.copyWith(
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  color: const Color.fromARGB(
                                                      255, 122, 131, 125),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                            _selectedTabIndex = 4;
                                          });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.book,
                                                color: Color.fromARGB(
                                                    255, 122, 131, 125),
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Doccuments",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: rubikMedium.copyWith(
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  color: const Color.fromARGB(
                                                      255, 122, 131, 125),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                            _selectedTabIndex = 5;
                                          });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.format_align_center,
                                                color: Color.fromARGB(
                                                    255, 122, 131, 125),
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Registration",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: rubikMedium.copyWith(
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  color: const Color.fromARGB(
                                                      255, 122, 131, 125),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 50, 10, 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 1,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              131, 122, 131, 125),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: const Border(),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            6, 0, 0, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 10, 20, 10),
                                          child: TextButton(
                                            onPressed: () {
                                             setState(() {
                                                  _selectedTabIndex = 6;
                                                });
                                            },
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons
                                                      .settings_ethernet_rounded,
                                                  color: Color.fromARGB(
                                                      255, 122, 131, 125),
                                                  size: 20,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Settings",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  style: rubikMedium.copyWith(
                                                    fontSize: Dimensions
                                                        .fontSizeDefault,
                                                    color: const Color.fromARGB(
                                                        255, 122, 131, 125),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          131, 122, 131, 125),
                                      borderRadius: BorderRadius.circular(12),
                                      border: const Border(
                                          // top: BorderSide(
                                          //   color: Colors.red,
                                          //   width: 4.0,  // Width of the border
                                          // ),
                                          ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Profile Photo
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://www.pixels.ng/wp-content/uploads/2022/02/DSC_2846.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width:
                                              16, // Space between photo and text
                                        ),
                                        // Name and Email
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'John Doe',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 115, 129, 119),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'john.doe@example.com',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 122, 131, 125),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: _selectedContent(_selectedTabIndex),
                    ),
                  ],
                ),
              ),
            ));
    });
  
  }

  Widget _selectedContent(int index) {
    switch (index) {
      case 0:
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
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 216, 216, 216),
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hi Here is today's Stats",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: rubikMedium.copyWith(
                                    fontSize: Dimensions.fontSizeDefault,
                                    color: Color.fromARGB(255, 79, 78, 78),
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Color.fromARGB(255, 122, 131, 125),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Icon(
                                      Icons.notifications_active_outlined,
                                      color: Color.fromARGB(255, 122, 131, 125),
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Dash
                            Text(
                              "Dashboard",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: rubikMedium.copyWith(
                                wordSpacing: 3,
                                fontSize: Dimensions.fontSizeOverLarge,
                                color: Color.fromARGB(255, 19, 18, 18),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
        });

      case 1:
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
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 213, 213, 213),
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        child: const Text("Reports")),
                  ),
                );
        });

      case 2:
        return ProfilesScreen();
        
        case 3:
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
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 213, 213, 213),
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        child: const Text("Verification")),
                  ),
                );
        });

      case 4:
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
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 213, 213, 213),
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        child: PdfPreview(
                                  maxPageWidth: 700,
                                  build: (format) => generateCertificate(format,),
                                ),
                        ),
                  ),
                );
        });

      case 5:
        return _selectedStepContent(_selectedStepIndex);

      case 6:
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
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 213, 213, 213),
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        child: const Text("Settings")),
                  ),
                );
        });

      // Add more cases as needed
      default:
        return const Text('Content not found');
    }
  }
 
 

 Widget _selectedStepContent(int index) {
    switch (index) {
      case 0:
        return GetBuilder<SimbaDesktopController>(
            builder: (simbaDesktopController) {
          return simbaDesktopController.profilesList == null
              ? const Scaffold(body: Center(child: Text("its empty")))
              : Container(
                  color: const Color(0xFF162231), // Main area color
                  child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(38),
                        margin: const EdgeInsets.fromLTRB(20, 25, 25, 20),
                        // color: Colors.white,
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 213, 213, 213),
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        child: SingleChildScrollView(
                            child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              30.height,
                              Text("Registration",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: rubikMedium.copyWith(
                                    wordSpacing: 3,
                                    fontSize: Dimensions.fontSizeOverLarge,
                                    color: Color.fromARGB(255, 19, 18, 18),
                                  )),
                              40.height,
                             
                             
                              Row(
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  // one
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Color.fromARGB(255, 2, 93, 13),
                                        child: Center(
                                          child: Text("1"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Personal Information",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                       Expanded(child: Line()),
                                  
                                  // two
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.black26,
                                        child: Center(
                                          child: Text("2"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Identification & Legal Status",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                          Expanded(child: Line()),
                                  // three
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.black26,
                                        child: Center(
                                          child: Text("3"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Contact & Emergency",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                          Expanded(child: Line()),
                                  // four
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.black26,
                                        child: Center(
                                          child: Text("4"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Employment & Education",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                    Expanded(child: Line()),
                                  // five
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.black26,
                                        child: Center(
                                          child: Text("5"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Medical & Miscellaneous",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                          Expanded(child: Line()),

                                  // six
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.black26,
                                        child: Center(
                                          child: Text("6"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Biomatrics Information",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                ],
                              ),

                              60.height,
                              Row(children: [
                                Expanded(
                                  child: CustomTextField(
                                    titleText: 'First Name'.tr,
                                    hintText: 'ex_jhon'.tr,
                                    controller: _first_name,
                                    focusNode: _first_nameFocus,
                                    nextFocus: _last_nameFocus,
                                    inputType: TextInputType.name,
                                    capitalization: TextCapitalization.words,
                                    prefixIcon: Icons.person,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                ),
                                const SizedBox(
                                    width: Dimensions.paddingSizeSmall),
                                Expanded(
                                  child: CustomTextField(
                                    titleText: 'Last Name'.tr,
                                    hintText: 'ex_doe'.tr,
                                    controller: _last_name,
                                    focusNode: _last_nameFocus,
                                    nextFocus: _middle_nameFocus,
                                    inputType: TextInputType.name,
                                    capitalization: TextCapitalization.words,
                                    prefixIcon: Icons.person,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                ),
                                const SizedBox(
                                    width: Dimensions.paddingSizeSmall),
                                Expanded(
                                  child: CustomTextField(
                                    titleText: 'Middle Name'.tr,
                                    hintText: 'ex_doe'.tr,
                                    controller: _middle_name,
                                    focusNode: _middle_nameFocus,
                                    nextFocus: _emailFocus,
                                    inputType: TextInputType.name,
                                    capitalization: TextCapitalization.words,
                                    prefixIcon: Icons.person,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                  height: Dimensions.paddingSizeLarge),

                              Row(children: [
                                ResponsiveHelper.isDesktop(context)
                                    ? Expanded(
                                        child: CustomTextField(
                                          titleText: 'Email'.tr,
                                          hintText: 'enter_email'.tr,
                                          controller: _email,
                                          focusNode: _emailFocus,
                                          nextFocus:
                                              _phone_numbeFocus, //_place_of_birthFocus,
                                          inputType: TextInputType.emailAddress,
                                          // prefixImage: Images.mail,
                                          showTitle: ResponsiveHelper.isDesktop(
                                              context),
                                        ),
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                    width: ResponsiveHelper.isDesktop(context)
                                        ? Dimensions.paddingSizeSmall
                                        : 0),
                                Expanded(
                                  child: CustomTextField(
                                    titleText: 'Phone'.tr,
                                    hintText: '07062722722'.tr,
                                    controller: _phone_number,
                                    focusNode: _phone_numbeFocus,
                                    nextFocus: _dobFocus,
                                    inputType: TextInputType.phone,
                                    // prefixImage: Images.mail,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                  height: Dimensions.paddingSizeLarge),

                              // _dob
                              Row(children: [
                                ResponsiveHelper.isDesktop(context)
                                    ? Expanded(
                                        child: CustomTextField(
                                          titleText: 'Date of birth'.tr,
                                          hintText: '12/12/2023'.tr,
                                          controller: _dob,
                                          focusNode: _dobFocus,
                                          nextFocus: _place_of_birthFocus,
                                          inputType: TextInputType.emailAddress,
                                          // prefixImage: Images.mail,
                                          showTitle: ResponsiveHelper.isDesktop(
                                              context),
                                        ),
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                    width: ResponsiveHelper.isDesktop(context)
                                        ? Dimensions.paddingSizeSmall
                                        : 0),
                                Expanded(
                                  child: CustomTextField(
                                    titleText: 'Place of birth'.tr,
                                    hintText: 'goma'.tr,
                                    controller: _place_of_birth,
                                    focusNode: _place_of_birthFocus,
                                    nextFocus: _nationalityFocus,
                                    inputType: TextInputType.name,
                                    // prefixImage: Images.mail,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                  height: Dimensions.paddingSizeLarge),

                              Row(children: [
                                ResponsiveHelper.isDesktop(context)
                                    ? Expanded(
                                        child: CustomTextField(
                                          titleText: 'Nationality'.tr,
                                          hintText: 'DRC'.tr,
                                          controller: _nationality,
                                          focusNode: _nationalityFocus,
                                          nextFocus: _marital_statusFocus,
                                          inputType: TextInputType.name,
                                          // prefixImage: Images.mail,
                                          showTitle: ResponsiveHelper.isDesktop(
                                              context),
                                        ),
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                    width: ResponsiveHelper.isDesktop(context)
                                        ? Dimensions.paddingSizeSmall
                                        : 0),
                                Expanded(
                                  child: CustomTextField(
                                    titleText: 'Marital Status'.tr,
                                    hintText: 'Single'.tr,
                                    controller: _marital_status,
                                    focusNode: _marital_statusFocus,
                                    nextFocus: _genderFocus,
                                    inputType: TextInputType.name,
                                    // prefixImage: Images.mail,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                  height: Dimensions.paddingSizeLarge),

                              Row(children: [
                                ResponsiveHelper.isDesktop(context)
                                    ? Expanded(
                                        child: CustomTextField(
                                          titleText: 'Gender'.tr,
                                          hintText: 'Male'.tr,
                                          controller: _gender,
                                          focusNode: _genderFocus,
                                          nextFocus: _spouse_nameFocus,
                                          inputType: TextInputType.name,
                                          // prefixImage: Images.mail,
                                          showTitle: ResponsiveHelper.isDesktop(
                                              context),
                                        ),
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                    width: ResponsiveHelper.isDesktop(context)
                                        ? Dimensions.paddingSizeSmall
                                        : 0),
                                Expanded(
                                  child: CustomTextField(
                                    titleText: 'Spouse name'.tr,
                                    hintText: '_spouse_name'.tr,
                                    controller: _spouse_name,
                                    focusNode: _spouse_nameFocus,
                                    nextFocus: _spouse_nameFocus,
                                    inputType: TextInputType.name,
                                    // prefixImage: Images.mail,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                  height: Dimensions.paddingSizeLarge),
                            
                            TextButton(
                                      onPressed: () {
                                         _register( simbaDesktopController, );
                                         setState(() {
                                                    _selectedStepIndex = 1;
                                       });
                                      },child: Text("Next") ),],

                            
                          ),
                          
                        )
                        )
                        ),
                  ),
                );
        }
      );
      case 1:
        return _stepTwo();
      case 2:
        return  _step3();

        case 3:
        return _step4();

        case 4:
        return _step5();

        case 5:
        return _step6();
      default:
        return Text('Content not found');
    }
  }


 _register(SimbaDesktopController authController){
      String firstName = _first_name.text.trim();
      String middle_name = _middle_name.text.trim();
      String last_name = _last_name.text.trim();
      String email = _email.text.trim();
      String phone_number = _phone_number.text.trim();
      DateTime dobup = DateTime.now();//_dob.text.trim() as DateTime;
      String place_of_birth = _place_of_birth.text.trim();
      String gender = _gender.text.trim();
      String nationality = _nationality.text.trim();
      String marital_status = _marital_status.text.trim();
      String spouse_name = _spouse_name.text.trim();
      // String username = "banks tester".trim();


      Profiles profiles = Profiles(
        username:firstName + last_name, 
        firstName:firstName, middleName: middle_name, email: email,phoneNumber: phone_number,
        dob: dobup, lastName: last_name, placeOfBirth: place_of_birth,
        gender: gender, nationality: nationality, maritalStatus: marital_status,
        spouseName: spouse_name
        );

       authController.registerUser(profiles);
 }
 

  final TextEditingController _national_id = TextEditingController();
  final TextEditingController _passport_number = TextEditingController();
  final TextEditingController _ssn = TextEditingController();
  final TextEditingController _driving_license = TextEditingController();

  final FocusNode _national_idFocus = FocusNode();
  final FocusNode _passport_numberFocus = FocusNode();
  final FocusNode _ssnFocus = FocusNode();
  final FocusNode _driving_licenseFocus = FocusNode();


_registerStep2(SimbaDesktopController authController) async {
      
      String national_id = _national_id.text.trim();
      String passportNo = _passport_number.text.trim();
      String ssn = _ssn.text.trim();
      String drivingL = _driving_license.text.trim();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId2 = prefs.getString('user_id') ?? '';
    
      Profiles profilesS2 = Profiles(
        userId: userId2,
        nationalId: national_id,
        passportNumber: passportNo,
        ssn: ssn,
        drivingLicense: drivingL
      );

       authController.registerUserS2(profilesS2);
 }

                
  Widget _stepTwo(){
   return GetBuilder<SimbaDesktopController>(
            builder: (simbaDesktopController) {
          return simbaDesktopController.profilesList == null
              ? const Scaffold(body: Center(child: Text("its empty")))
              : Container(
                  color: const Color(0xFF162231), // Main area color
                  child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(38),
                        margin: const EdgeInsets.fromLTRB(20, 25, 25, 20),
                        // color: Colors.white,
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 213, 213, 213),
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        child: SingleChildScrollView(
                            child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              30.height,
                              Text("Registration",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: rubikMedium.copyWith(
                                    wordSpacing: 3,
                                    fontSize: Dimensions.fontSizeOverLarge,
                                    color: Color.fromARGB(255, 19, 18, 18),
                                  )),
                              40.height,
                             
                             
                              Row(
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  // one
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Color.fromARGB(255, 2, 93, 13),
                                        child: Center(
                                          child: Text("1"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Personal Information",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                       Expanded(child: Line()),
                                  
                                  // two
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Color.fromARGB(255, 2, 93, 13),
                                        child: Center(
                                          child: Text("2"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Identification & Legal Status",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                          Expanded(child: Line()),
                                  // three
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.black26,
                                        child: Center(
                                          child: Text("3"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Contact & Emergency",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                          Expanded(child: Line()),
                                  // four
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.black26,
                                        child: Center(
                                          child: Text("4"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Employment & Education",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                    Expanded(child: Line()),
                                  // five
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.black26,
                                        child: Center(
                                          child: Text("5"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Medical & Miscellaneous",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                          Expanded(child: Line()),

                                  // six
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.black26,
                                        child: Center(
                                          child: Text("6"),
                                        ),
                                      ).cornerRadiusWithClipRRect(50),
                                      15.height,
                                      Text("Biomatrics Information",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: rubikMedium.copyWith(
                                            wordSpacing: 3,
                                            fontSize:
                                                Dimensions.fontSizeSmall,
                                            color: Color.fromARGB(
                                                255, 19, 18, 18),
                                          ))
                                    ],
                                  ),
                                ],
                              ),


                              60.height,
                              Row(children: [
                                Expanded(
                                  child: CustomTextField(
                                    titleText: 'national id'.tr,
                                    hintText: '12345678dfgh'.tr,
                                    controller: _national_id,
                                    focusNode: _national_idFocus,
                                    nextFocus: _passport_numberFocus,
                                    inputType: TextInputType.name,
                                    capitalization: TextCapitalization.words,
                                    prefixIcon: Icons.person,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                ),
                                const SizedBox(
                                    width: Dimensions.paddingSizeSmall),
                                Expanded(
                                  child: CustomTextField(
                                    titleText: '_passport_number'.tr,
                                    hintText: 'sdfghj2345'.tr,
                                    controller: _passport_number,
                                    focusNode: _passport_numberFocus,
                                    nextFocus: _ssnFocus,
                                    inputType: TextInputType.name,
                                    capitalization: TextCapitalization.words,
                                    prefixIcon: Icons.person,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                ),
                                const SizedBox(
                                    width: Dimensions.paddingSizeSmall),
                                Expanded(
                                  child: CustomTextField(
                                    titleText: 'Social Security No.'.tr,
                                    hintText: 'GFD5454545'.tr,
                                    controller: _ssn,
                                    focusNode: _ssnFocus,
                                    nextFocus: _driving_licenseFocus,
                                    inputType: TextInputType.name,
                                    capitalization: TextCapitalization.words,
                                    prefixIcon: Icons.person,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                  height: Dimensions.paddingSizeLarge),
  
  
                              Row(children: [
                                ResponsiveHelper.isDesktop(context)
                                    ? Expanded(
                                        child: CustomTextField(
                                          titleText: 'driving license'.tr,
                                          hintText: ' '.tr,
                                          controller: _driving_license,
                                          focusNode: _driving_licenseFocus,
                                          nextFocus:
                                              _phone_numbeFocus, //_place_of_birthFocus,
                                          inputType: TextInputType.emailAddress,
                                          // prefixImage: Images.mail,
                                          showTitle: ResponsiveHelper.isDesktop(
                                              context),
                                        ),
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                    width: ResponsiveHelper.isDesktop(context)
                                        ? Dimensions.paddingSizeSmall
                                        : 0),
                                Expanded(
                                  child: CustomTextField(
                                    titleText: 'Military Service Record'.tr,
                                    hintText: 'yes'.tr,
                                    // controller: '',
                                    // focusNode: _phone_numbeFocus,
                                    // nextFocus: _dobFocus,
                                    inputType: TextInputType.phone,
                                    // prefixImage: Images.mail,
                                    showTitle:
                                        ResponsiveHelper.isDesktop(context),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                  height: Dimensions.paddingSizeLarge),

                             
                            TextButton(
                                      onPressed: () {
                                        _registerStep2( simbaDesktopController, );
                                         setState(() {
                                                    _selectedStepIndex = 2;
                                       });
                                      },child: Text("Next") ),],

                            
                          ),
                          
                        )
                        )
                        ),
                  ),
                );
        }
      );
      
 }

                  final TextEditingController _residential_address = TextEditingController();
                  final TextEditingController _mailing_address = TextEditingController();
                  final TextEditingController _emergency_contact_name = TextEditingController();
                  final TextEditingController _emergency_contact_relationship = TextEditingController();
                  final TextEditingController _emergency_contact_phone = TextEditingController();

                  final FocusNode _residential_addressFocus = FocusNode();
                  final FocusNode _mailing_addressFocus = FocusNode();
                  final FocusNode _emergency_contact_nameFocus = FocusNode();
                  final FocusNode _emergency_contact_relationshipFocus = FocusNode();
                  final FocusNode _emergency_contact_phoneFocus = FocusNode();


  _registerStep3(SimbaDesktopController authController) async {
      
      String residential_address = _residential_address.text.trim();
      String mailing_address = _mailing_address.text.trim();
      String emergency_contact_name = _emergency_contact_name.text.trim();
      String emergency_contact_relationship = _emergency_contact_relationship.text.trim();
      String emergency_contact_phone = _emergency_contact_phone.text.trim();

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String userId2 = prefs.getString('user_id') ?? '';
      
      Profiles profilesS3 = Profiles(
        

        userId: userId2,
        residentialAddress: residential_address,
        mailingAddress: mailing_address,
        emergencyContactName: emergency_contact_name,
        emergencyContactRelationship: emergency_contact_relationship,
        emergencyContactPhone: emergency_contact_phone
      );

       authController.registerUserS3(profilesS3);
 }


// contacts
  Widget _step3(){
    return GetBuilder<SimbaDesktopController>(
              builder: (simbaDesktopController) {
            return simbaDesktopController.profilesList == null
                ? const Scaffold(body: Center(child: Text("its empty")))
                : Container(
                    color: const Color(0xFF162231), // Main area color
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.all(38),
                          margin: const EdgeInsets.fromLTRB(20, 25, 25, 20),
                          // color: Colors.white,
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 213, 213, 213),
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                          child: SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                30.height,
                                Text("Registration",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: rubikMedium.copyWith(
                                      wordSpacing: 3,
                                      fontSize: Dimensions.fontSizeOverLarge,
                                      color: Color.fromARGB(255, 19, 18, 18),
                                    )),
                                40.height,
                              
                              
                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children: [
                                    
                                    // one
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("1"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Personal Information",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                        Expanded(child: Line()),
                                    
                                    // two
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("2"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Identification & Legal Status",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                            Expanded(child: Line()),
                                    // three
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("3"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Contact & Emergency",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                            Expanded(child: Line()),
                                    // four
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.black26,
                                          child: Center(
                                            child: Text("4"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Employment & Education",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                      Expanded(child: Line()),
                                    // five
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.black26,
                                          child: Center(
                                            child: Text("5"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Medical & Miscellaneous",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                            Expanded(child: Line()),

                                    // six
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.black26,
                                          child: Center(
                                            child: Text("6"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Biomatrics Information",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
   
                                60.height,
                                Row(children: [
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: '_residential_address'.tr,
                                      hintText:  '_residential_address'.tr,
                                      controller: _residential_address,
                                      focusNode: _residential_addressFocus,
                                      nextFocus: _mailing_addressFocus,
                                      inputType: TextInputType.name,
                                      capitalization: TextCapitalization.words,
                                      prefixIcon: Icons.person,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  ),
                                  const SizedBox(
                                      width: Dimensions.paddingSizeSmall),
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'mailing address'.tr,
                                      hintText: 'mailing address'.tr,
                                      controller: _mailing_address,
                                      focusNode: _mailing_addressFocus,
                                      nextFocus: _emergency_contact_nameFocus,
                                      inputType: TextInputType.name,
                                      capitalization: TextCapitalization.words,
                                      prefixIcon: Icons.person,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  ),
                                  const SizedBox(
                                      width: Dimensions.paddingSizeSmall),
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'emergency contact Name'.tr,
                                      hintText: '_emergency_contact_name'.tr,
                                      controller: _emergency_contact_name,
                                      focusNode: _emergency_contact_nameFocus,
                                      nextFocus: _emergency_contact_relationshipFocus,
                                      inputType: TextInputType.name,
                                      capitalization: TextCapitalization.words,
                                      prefixIcon: Icons.person,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  )
                                ]),
                                const SizedBox(
                                    height: Dimensions.paddingSizeLarge),


             
                                Row(children: [
                                  ResponsiveHelper.isDesktop(context)
                                      ? Expanded(
                                          child: CustomTextField(
                                            titleText: '_emergency_contact_relationship'.tr,
                                            hintText: '_emergency_contact_relationship'.tr,
                                            controller: _emergency_contact_relationship,
                                            focusNode: _emergency_contact_relationshipFocus,
                                            nextFocus: _emergency_contact_phoneFocus, //_place_of_birthFocus,
                                            inputType: TextInputType.emailAddress,
                                            // prefixImage: Images.mail,
                                            showTitle: ResponsiveHelper.isDesktop(
                                                context),
                                          ),
                                        )
                                      : const SizedBox(),
                                  SizedBox(
                                      width: ResponsiveHelper.isDesktop(context)
                                          ? Dimensions.paddingSizeSmall
                                          : 0),
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'emergency Contact Phone'.tr,
                                      hintText: '07062722722'.tr,
                                      controller: _emergency_contact_phone,
                                      focusNode: _emergency_contact_phoneFocus,
                                      // nextFocus: _dobFocus,
                                      inputType: TextInputType.phone,
                                      // prefixImage: Images.mail,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  )
                                ]),
                                const SizedBox(
                                    height: Dimensions.paddingSizeLarge),

                               const SizedBox(
                                    height: Dimensions.paddingSizeLarge),
                              
                              TextButton(
                                        onPressed: () {
                                         _registerStep3( simbaDesktopController, );
                                          setState(() {
                                                      _selectedStepIndex = 3;
                                        });
                                        },child: Text("Next") ),],

                              
                            ),
                            
                          )
                          )
                          ),
                    ),
                  );
          }
        );
        
  }

    final TextEditingController current_job_title = TextEditingController();
    final TextEditingController employment_history = TextEditingController();
    final TextEditingController institutions_attended = TextEditingController();
    final TextEditingController highest_education = TextEditingController();
    final TextEditingController graduation_years = TextEditingController();
    final TextEditingController skills_or_qualifications = TextEditingController();

    final FocusNode _current_job_titleFocus = FocusNode();
    final FocusNode _employment_historyFocus = FocusNode();
    final FocusNode highest_educationFocus = FocusNode();
    final FocusNode institutions_attendedFocus = FocusNode();
    final FocusNode _graduation_yearsFocus = FocusNode();
    final FocusNode _skills_or_qualificationFocus = FocusNode();

   
  _registerStep4(SimbaDesktopController authController) async {
      
      String current_job_t = current_job_title.text.trim();
      String employment_h = employment_history.text.trim();
      String institutions_a = institutions_attended.text.trim();
      String _highest_education = highest_education.text.trim();
      String _graduation_years = graduation_years.text.trim();
      String skills_or_qualifi = skills_or_qualifications.text.trim();


      SharedPreferences prefs = await SharedPreferences.getInstance();

      String userId2 = prefs.getString('user_id') ?? '';
      
      Profiles profilesS4 = Profiles(
        currentJobTitle: current_job_t, 
        employmentHistory: employment_h,
        institutionsAttended: institutions_a, 
        highestEducation: _highest_education,
        graduationYears: _graduation_years, 
        skillsOrQualifications: skills_or_qualifi,

        userId: userId2,
        // residentialAddress: residential_address,
        // mailingAddress: mailing_address,
        // emergencyContactName: emergency_contact_name,
        // emergencyContactRelationship: emergency_contact_relationship,
        // emergencyContactPhone: emergency_contact_phone
      );

       authController.registerUserS4(profilesS4);
 }

               


  Widget _step4(){
    return GetBuilder<SimbaDesktopController>(
              builder: (simbaDesktopController) {
            return simbaDesktopController.profilesList == null
                ? const Scaffold(body: Center(child: Text("its empty")))
                : Container(
                    color: const Color(0xFF162231), // Main area color
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.all(38),
                          margin: const EdgeInsets.fromLTRB(20, 25, 25, 20),
                          // color: Colors.white,
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 213, 213, 213),
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                          child: SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                30.height,
                                Text("Registration",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: rubikMedium.copyWith(
                                      wordSpacing: 3,
                                      fontSize: Dimensions.fontSizeOverLarge,
                                      color: Color.fromARGB(255, 19, 18, 18),
                                    )),
                                40.height,
                              
                              
                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children: [
                                    
                                    // one
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("1"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Personal Information",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                        Expanded(child: Line()),
                                    
                                    // two
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("2"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Identification & Legal Status",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                            Expanded(child: Line()),
                                    // three
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("3"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Contact & Emergency",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                            Expanded(child: Line()),
                                    // four
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("4"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Employment & Education",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                      Expanded(child: Line()),
                                    // five
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.black26,
                                          child: Center(
                                            child: Text("5"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Medical & Miscellaneous",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                            Expanded(child: Line()),

                                    // six
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.black26,
                                          child: Center(
                                            child: Text("6"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Biomatrics Information",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),

                                60.height,
                                Row(children: [
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'current_job_title'.tr,
                                      hintText: 'current_job_title'.tr,
                                      controller: current_job_title,
                                      focusNode: _current_job_titleFocus,
                                      nextFocus: _employment_historyFocus,
                                      inputType: TextInputType.name,
                                      capitalization: TextCapitalization.words,
                                      prefixIcon: Icons.person,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  ),
                                  const SizedBox(
                                      width: Dimensions.paddingSizeSmall),
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'employment_history'.tr,
                                      hintText: 'employment_history'.tr,
                                      controller: employment_history,
                                      focusNode: _employment_historyFocus,
                                      nextFocus: highest_educationFocus,
                                      inputType: TextInputType.name,
                                      capitalization: TextCapitalization.words,
                                      prefixIcon: Icons.person,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  ),
                                  const SizedBox(
                                      width: Dimensions.paddingSizeSmall),
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'highest_education'.tr,
                                      hintText: 'highest_education'.tr,
                                      controller: highest_education,
                                      focusNode: highest_educationFocus,
                                      nextFocus: institutions_attendedFocus,
                                      inputType: TextInputType.name,
                                      capitalization: TextCapitalization.words,
                                      prefixIcon: Icons.person,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  )
                                ]),
                                const SizedBox(
                                    height: Dimensions.paddingSizeLarge),

                                Row(children: [
                                  ResponsiveHelper.isDesktop(context)
                                      ? Expanded(
                                          child: CustomTextField(
                                            titleText: 'institutions_attended'.tr,
                                            hintText: 'institutions_attended'.tr,
                                            controller: institutions_attended,
                                            focusNode: institutions_attendedFocus,
                                            nextFocus:
                                                _graduation_yearsFocus, //_place_of_birthFocus,
                                            inputType: TextInputType.emailAddress,
                                            // prefixImage: Images.mail,
                                            showTitle: ResponsiveHelper.isDesktop(
                                                context),
                                          ),
                                        )
                                      : const SizedBox(),
                                  SizedBox(
                                      width: ResponsiveHelper.isDesktop(context)
                                          ? Dimensions.paddingSizeSmall
                                          : 0),
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: '_graduation_yearsFocus'.tr,
                                      hintText: '1990'.tr,
                                      controller: graduation_years,
                                      focusNode: _graduation_yearsFocus,
                                      nextFocus: _skills_or_qualificationFocus,
                                      inputType: TextInputType.phone,
                                      // prefixImage: Images.mail,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  ),

                                    Expanded(
                                    child: CustomTextField(
                                      titleText: 'skills or qualifications'.tr,
                                      hintText: 'engineer'.tr,
                                      controller: skills_or_qualifications,
                                      focusNode: _graduation_yearsFocus,
                                      nextFocus: _skills_or_qualificationFocus,
                                      inputType: TextInputType.phone,
                                      // prefixImage: Images.mail,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  )
                                ]),



                                const SizedBox(
                                    height: Dimensions.paddingSizeLarge),

                             
                              TextButton(
                                        onPressed: () {
                                          _registerStep4( simbaDesktopController, );
                                          setState(() {
                                                      _selectedStepIndex = 4;
                                        });
                                        },child: Text("Next") ),],

                              
                            ),
                            
                          )
                          )
                          ),
                    ),
                  );
          }
        );
        
  }

    final TextEditingController privacy_policy_ack = TextEditingController();
    final TextEditingController facial_data = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController fingerprint_data = TextEditingController();
    final TextEditingController audit_logs = TextEditingController();
    final TextEditingController retina_scan = TextEditingController();
    final TextEditingController languages_spoken = TextEditingController();
    final TextEditingController medical_history = TextEditingController();
    final TextEditingController known_allergies = TextEditingController();
    final TextEditingController blood_type = TextEditingController();
    final FocusNode _privacy_policy_ackFocus = FocusNode();
    final FocusNode _facial_dataFocus = FocusNode();
    final FocusNode passwordFocus = FocusNode();
    final FocusNode _fingerprint_dataFocus = FocusNode();
    final FocusNode _audit_logsFocus = FocusNode();
    final FocusNode _retina_scanFocus = FocusNode();
    final FocusNode _languages_spokenFocus = FocusNode();
    final FocusNode _medical_historyeFocus = FocusNode();
    final FocusNode _known_allergiesFocus = FocusNode();
    final FocusNode _blood_typeFocus = FocusNode();
  



  _registerStep5(SimbaDesktopController authController) async {
      
      String privacy = privacy_policy_ack.text.trim();
      String facial = facial_data.text.trim();
      String _password = "123456";
      String _fingerprint_data = fingerprint_data.text.trim();
      String _audit_logs = graduation_years.text.trim();
      String _retina_scan = skills_or_qualifications.text.trim();
      String _languages_spoken = '';
      String _medical_history = '';
      String _known_allergies = '';
      String _blood_type =blood_type.text.trim();

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String userId2 = prefs.getString('user_id') ?? '';
      
      Profiles profilesS5 = Profiles(
       
       userId: userId2,

      // privacyPolicyAck: true,
      facialData: facial,
      password: "123456",
      fingerprintData: _fingerprint_data,
      auditLogs: "",
      retinaScan: _retina_scan,
      languagesSpoken: _languages_spoken,
      medicalHistory: _medical_history,
      knownAllergies: _known_allergies,
      bloodType: _blood_type,
    
     );

       authController.registerUserS5(profilesS5);
 }
  
  Widget _step5(){
    return GetBuilder<SimbaDesktopController>(
              builder: (simbaDesktopController) {
            return simbaDesktopController.profilesList == null
                ? const Scaffold(body: Center(child: Text("its empty")))
                : Container(
                    color: const Color(0xFF162231), // Main area color
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.all(38),
                          margin: const EdgeInsets.fromLTRB(20, 25, 25, 20),
                          // color: Colors.white,
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 213, 213, 213),
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                          child: SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                30.height,
                                Text("Registration",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: rubikMedium.copyWith(
                                      wordSpacing: 3,
                                      fontSize: Dimensions.fontSizeOverLarge,
                                      color: Color.fromARGB(255, 19, 18, 18),
                                    )),
                                40.height,
                              
             
                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children: [
                                    
                                    // one
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("1"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Personal Information",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                        Expanded(child: Line()),
                                    
                                    // two
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("2"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Identification & Legal Status",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                            Expanded(child: Line()),
                                    // three
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("3"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Contact & Emergency",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                            Expanded(child: Line()),
                                    // four
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("4"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Employment & Education",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                      Expanded(child: Line()),
                                    // five
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Color.fromARGB(255, 2, 93, 13),
                                          child: Center(
                                            child: Text("5"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Medical & Miscellaneous",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                            Expanded(child: Line()),

                                    // six
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.black26,
                                          child: Center(
                                            child: Text("6"),
                                          ),
                                        ).cornerRadiusWithClipRRect(50),
                                        15.height,
                                        Text("Biomatrics Information",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: rubikMedium.copyWith(
                                              wordSpacing: 3,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),

                                60.height,
                                Row(children: [
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'facial_data'.tr,
                                      hintText: 'add photos'.tr,
                                      controller: facial_data,
                                      focusNode: _facial_dataFocus,
                                      nextFocus: _fingerprint_dataFocus,
                                      inputType: TextInputType.name,
                                      capitalization: TextCapitalization.words,
                                      prefixIcon: Icons.person,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  ),
                                  const SizedBox(
                                      width: Dimensions.paddingSizeSmall),
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'fingerprint_data'.tr,
                                      hintText: 'ex_doe'.tr,
                                      controller: fingerprint_data,
                                      focusNode: _fingerprint_dataFocus,
                                      nextFocus: _languages_spokenFocus,
                                      inputType: TextInputType.name,
                                      capitalization: TextCapitalization.words,
                                      prefixIcon: Icons.person,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  ),
                                  const SizedBox(
                                      width: Dimensions.paddingSizeSmall),
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'known allergies'.tr,
                                      hintText: 'no'.tr,
                                      controller: known_allergies,
                                      focusNode: _known_allergiesFocus,
                                      nextFocus: _languages_spokenFocus,
                                      inputType: TextInputType.name,
                                      capitalization: TextCapitalization.words,
                                      prefixIcon: Icons.person,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  )
                                ]),
                                const SizedBox(
                                    height: Dimensions.paddingSizeLarge),

                                Row(children: [
                                  ResponsiveHelper.isDesktop(context)
                                      ? Expanded(
                                          child: CustomTextField(
                                            titleText: 'languages spoken'.tr,
                                            hintText: 'languages spoken'.tr,
                                            controller: languages_spoken,
                                            focusNode: _medical_historyeFocus,
                                            nextFocus:
                                                _blood_typeFocus, //_place_of_birthFocus,
                                            inputType: TextInputType.name,
                                            // prefixImage: Images.mail,
                                            showTitle: ResponsiveHelper.isDesktop(
                                                context),
                                          ),
                                        )
                                      : const SizedBox(),
                                  
                                  SizedBox(
                                      width: ResponsiveHelper.isDesktop(context)
                                          ? Dimensions.paddingSizeSmall
                                          : 0),
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'blood_type'.tr,
                                      hintText: 'A+'.tr,
                                      controller: blood_type,
                                      focusNode: _blood_typeFocus,
                                      nextFocus: _dobFocus,
                                      // inputType: TextInputType.phone,
                                      // prefixImage: Images.mail,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                    ),
                                  )
                                ]),
                                const SizedBox(
                                    height: Dimensions.paddingSizeLarge),
                              
                            const SizedBox(
                                    height: Dimensions.paddingSizeLarge),
                              
                              TextButton(
                                        onPressed: () {
                                          _registerStep5( simbaDesktopController, );
                                          setState(() {
                                                      _selectedStepIndex = 5;
                                        });
                                        },child: Text("Next") ),],

                              
                            ),
                            
                          )
                          )
                          ),
                    ),
                  );
          }
        );
        
  }








 final TextEditingController userIdController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile?> images = [null, null, null];

  // Future<void> _uploadImages() async {

  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //     // String userId2 = prefs.getString('user_id') ?? '';
  //   final user_id =  prefs.getString('user_id') ?? '';

  //   if (user_id.isEmpty || images.contains(null)) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Please fill in all fields and select images")),
  //     );
  //     return;
  //   }

  //   try {
  //     // Convert the images to bytes
  //     List<List<int>> imageBytes = [];
  //     for (XFile? imageFile in images) {
  //       if (imageFile != null) {
  //         final bytes = await imageFile.readAsBytes();
  //         imageBytes.add(bytes);
  //       }
  //     }

  //     // Send the images to your backend
  //     final response = await http.post(
  //       Uri.parse('http://127.0.0.1:8080/kycphotos2'),
  //       // headers: {
  //       //   'Content-Type': 'multipart/form-data',
  //       // },
  //       body: {
  //         'user_id': user_id,
  //         'front_photo': base64Encode(imageBytes[0]),
  //         'left_photo': base64Encode(imageBytes[1]),
  //         'right_photo': base64Encode(imageBytes[2]),
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Images uploaded successfully")),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Error uploading images. Please try again.")),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Error: $e")),
        
  //     );
  //     print("Error: $e");
  //   }
  // }

  // Future<void> _selectImage(int index) async {
  //   final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       images[index] = pickedFile;
  //     });
  //   }
  // }
//  Future<void> _uploadImages() async {
    
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     final user_id = prefs.getString('user_id') ?? '';

//     if (user_id.isEmpty || images.contains(null)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please fill in all fields and select images")),
//       );
//       return;
//     }

//     try {
//       final request = http.MultipartRequest(
//         'POST',
//         Uri.parse('http://127.0.0.1:8080/kycphotos1'),
//       );

   
//       request.fields['user_id'] = user_id;

//       for (int i = 0; i < 3; i++) {
//         if (images[i] != null) {
//           final file = File(images[i]!.path);

//           final mimeType = lookupMimeType(file.path);
//           final multipartFile = await http.MultipartFile.fromPath(
//             'image$i', // This should match the field name expected by your backend
//             file.path,
//             contentType: MediaType.parse(mimeType!),
//           );

//           request.files.add(multipartFile);
//         }
//       }

//       final response = await request.send();

//       if (response.statusCode == 200) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Images uploaded successfully")),
        // );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error uploading images. Please try again.")),
//         );
//       }
//     } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Error: $e")),
      // );
//     }
//   }

//   Future<void> _selectImage(int index) async {
//     final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         images[index] = pickedFile;
//       });
//     }
//   }



 File? _image;

  // Function to pick an image from the device's gallery
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // Function to upload the selected image to the server
  Future<void> _uploadImage() async {
    if (_image == null) {
      // No image selected, show an error message or handle it as needed
      return;
    }

    final url = Uri.parse('http://localhost:8080/kycphotos1'); // Replace with your server's upload image endpoint

SharedPreferences prefs = await SharedPreferences.getInstance();

    final user_id = prefs.getString('user_id') ?? '';
    

    final request = http.MultipartRequest('POST', url);
    request.fields['user_id'] = user_id; // Replace with the actual user ID

    
    final imageFile = await http.MultipartFile.fromPath('image', _image!.path);
    request.files.add(imageFile);

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        // Image uploaded successfully, handle the response as needed
        print('Image uploaded successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Images uploaded successfully")),
        );
      } else {
        // Handle the error, e.g., server error or image upload failed
        print('Image upload failed: ${response.statusCode}');
        
      }
    } catch (e) {
      // Handle network or request error
      print('Request error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  Widget _step6(){
    return GetBuilder<SimbaDesktopController>(
              builder: (simbaDesktopController) {
            return simbaDesktopController.profilesList == null
                ? const Scaffold(body: Center(child: Text("its empty")))
                : Container(
                    color: const Color(0xFF162231), // Main area color
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.all(38),
                          margin: const EdgeInsets.fromLTRB(20, 25, 25, 20),
                          // color: Colors.white,
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 213, 213, 213),
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                          child: SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           Center(
        child: Column(
          children: <Widget>[
            if (_image != null) Image.file(_image!),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick an Image'),
            ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
          ],
        ),
      ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 30.height,
//                                 Text("Registration",
//                                     textAlign: TextAlign.center,
//                                     maxLines: 2,
//                                     style: rubikMedium.copyWith(
//                                       wordSpacing: 3,
//                                       fontSize: Dimensions.fontSizeOverLarge,
//                                       color: Color.fromARGB(255, 19, 18, 18),
//                                     )),
//                                 40.height,
                              
                              
//                                 Row(
//                                   crossAxisAlignment:CrossAxisAlignment.center,
//                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                                   children: [
                                    
//                                     // one
//                                     Column(
//                                       children: [
//                                         Container(
//                                           height: 50,
//                                           width: 50,
//                                           color: Color.fromARGB(255, 2, 93, 13),
//                                           child: Center(
//                                             child: Text("1"),
//                                           ),
//                                         ).cornerRadiusWithClipRRect(50),
//                                         15.height,
//                                         Text("Personal Information",
//                                             textAlign: TextAlign.center,
//                                             maxLines: 2,
//                                             style: rubikMedium.copyWith(
//                                               wordSpacing: 3,
//                                               fontSize:
//                                                   Dimensions.fontSizeSmall,
//                                               color: Color.fromARGB(
//                                                   255, 19, 18, 18),
//                                             ))
//                                       ],
//                                     ),
//                                         Expanded(child: Line()),
                                    
//                                     // two
//                                     Column(
//                                       children: [
//                                         Container(
//                                           height: 50,
//                                           width: 50,
//                                           color: Color.fromARGB(255, 2, 93, 13),
//                                           child: Center(
//                                             child: Text("2"),
//                                           ),
//                                         ).cornerRadiusWithClipRRect(50),
//                                         15.height,
//                                         Text("Identification & Legal Status",
//                                             textAlign: TextAlign.center,
//                                             maxLines: 2,
//                                             style: rubikMedium.copyWith(
//                                               wordSpacing: 3,
//                                               fontSize:
//                                                   Dimensions.fontSizeSmall,
//                                               color: Color.fromARGB(
//                                                   255, 19, 18, 18),
//                                             ))
//                                       ],
//                                     ),
//                                             Expanded(child: Line()),
//                                     // three
//                                     Column(
//                                       children: [
//                                         Container(
//                                           height: 50,
//                                           width: 50,
//                                           color: Color.fromARGB(255, 2, 93, 13),
//                                           child: Center(
//                                             child: Text("3"),
//                                           ),
//                                         ).cornerRadiusWithClipRRect(50),
//                                         15.height,
//                                         Text("Contact & Emergency",
//                                             textAlign: TextAlign.center,
//                                             maxLines: 2,
//                                             style: rubikMedium.copyWith(
//                                               wordSpacing: 3,
//                                               fontSize:
//                                                   Dimensions.fontSizeSmall,
//                                               color: Color.fromARGB(
//                                                   255, 19, 18, 18),
//                                             ))
//                                       ],
//                                     ),
//                                             Expanded(child: Line()),
//                                     // four
//                                     Column(
//                                       children: [
//                                         Container(
//                                           height: 50,
//                                           width: 50,
//                                           color: Color.fromARGB(255, 2, 93, 13),
//                                           child: Center(
//                                             child: Text("4"),
//                                           ),
//                                         ).cornerRadiusWithClipRRect(50),
//                                         15.height,
//                                         Text("Employment & Education",
//                                             textAlign: TextAlign.center,
//                                             maxLines: 2,
//                                             style: rubikMedium.copyWith(
//                                               wordSpacing: 3,
//                                               fontSize:
//                                                   Dimensions.fontSizeSmall,
//                                               color: Color.fromARGB(
//                                                   255, 19, 18, 18),
//                                             ))
//                                       ],
//                                     ),
//                                       Expanded(child: Line()),
//                                     // five
//                                     Column(
//                                       children: [
//                                         Container(
//                                           height: 50,
//                                           width: 50,
//                                           color: Color.fromARGB(255, 2, 93, 13),
//                                           child: Center(
//                                             child: Text("5"),
//                                           ),
//                                         ).cornerRadiusWithClipRRect(50),
//                                         15.height,
//                                         Text("Medical & Miscellaneous",
//                                             textAlign: TextAlign.center,
//                                             maxLines: 2,
//                                             style: rubikMedium.copyWith(
//                                               wordSpacing: 3,
//                                               fontSize:
//                                                   Dimensions.fontSizeSmall,
//                                               color: Color.fromARGB(
//                                                   255, 19, 18, 18),
//                                             ))
//                                       ],
//                                     ),
//                                             Expanded(child: Line()),

//                                     // six
//                                     Column(
//                                       children: [
//                                         Container(
//                                           height: 50,
//                                           width: 50,
//                                           color: Color.fromARGB(255, 2, 93, 13),
//                                           child: Center(
//                                             child: Text("6"),
//                                           ),
//                                         ).cornerRadiusWithClipRRect(50),
//                                         15.height,
//                                         Text("Biomatrics Information",
//                                             textAlign: TextAlign.center,
//                                             maxLines: 2,
//                                             style: rubikMedium.copyWith(
//                                               wordSpacing: 3,
//                                               fontSize:
//                                                   Dimensions.fontSizeSmall,
//                                               color: Color.fromARGB(
//                                                   255, 19, 18, 18),
//                                             ))
//                                       ],
//                                     ),
//                                   ],
//                                 ),

//                                 60.height,
//                         Text('upload_your_image'.tr, style: rubikRegular),
//                 const SizedBox(height: Dimensions.paddingSizeDefault,),

//                 Container(
//                   height: 100,padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
//                   child: Row(
//                         children: [
//                           Stack(
//                             children: [

//                               Positioned(
//                                 bottom:0,right:0,
//                                 child: InkWell(
//                                   onTap :() {},
//                                   child: Container(
//                                       decoration: BoxDecoration(
//                                           color: Colors.red.withOpacity(0.2),
//                                           borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeDefault))
//                                       ),
//                                       child: const Padding(
//                                         padding: EdgeInsets.all(5.0),
//                                         child: Icon(Icons.delete_outline,color: Colors.red,size: 16,),
//                                       )),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: Dimensions.paddingSizeDefault),
//                         ],
//                       ) //:const SizedBox();
// ,
//                 ),
//                 const SizedBox(height: Dimensions.paddingSizeExtraLarge),


               
//                                 const SizedBox(
//                                     height: Dimensions.paddingSizeLarge),
                              
//                                     TextButton(
//                                         onPressed: () {
//                                           _register( simbaDesktopController, );
//                                           setState(() {
//                                                       _selectedStepIndex = 6;
//                                         });
//                                         },child: Text("Next") ),
                                        
//                               ],
//                             ),
                            
                          )
                          )
                          ),
                    ),
                  );
          }
        );
        
  }

  // last line
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      color: Colors.grey[300],
    );
  }
}



class StepTwo extends StatelessWidget {
  final controller = Get.put(SimbaDesktopController(simbaRepo: Get.find(), sharedPreferences: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<SimbaDesktopController>(
                builder: (_) => Text(
                      'clicks: ${1}',
                    )),
            ElevatedButton(
              child: Text('Next Route'),
              onPressed: () {
                // Get.to(Second());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},  
          ),
    );
  }
}