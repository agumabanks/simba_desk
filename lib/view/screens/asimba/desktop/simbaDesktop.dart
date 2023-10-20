import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simbadesketop/controller/auth_controller.dart';
import 'package:simbadesketop/controller/localization_controller.dart';
import 'package:simbadesketop/controller/simba/simbaDesktopContllor.dart';
import 'package:simbadesketop/data/model/simbaProfile.dart';
import 'package:simbadesketop/helper/phone_cheker.dart';
import 'package:simbadesketop/helper/route_helper.dart';
import 'package:simbadesketop/util/dimensions.dart';
import 'package:simbadesketop/util/images.dart';
import 'package:simbadesketop/util/styles.dart';
import 'package:simbadesketop/view/base/custom_ink_well.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/custom_text_field.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/profilesScreen.dart';
// import 'package:simbadesketop/view/base/custom_text_field.dart';
import 'package:simbadesketop/view/screens/profile/widget/menu_item.dart';
import 'package:simbadesketop/view/screens/profile/widget/menu_item.dart';

import '../../../../helper/responsive_helper.dart';
import '../../requested_money/widget/custom_button.dart';

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
  // final FocusNode _emailFocus = FocusNode();
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
                        child: const Text("Doccuments")),
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
                                    titleText: '_national_id'.tr,
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
                                    titleText: 'Middle Name'.tr,
                                    hintText: 'ex_doe'.tr,
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
                                          titleText: 'Email'.tr,
                                          hintText: 'enter_email'.tr,
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





                  // final TextEditingController _email_address = TextEditingController();

                  // final FocusNode _emergency_contact_relationshipFocus = FocusNode();
                  // final FocusNode _emergency_contact_phoneFocus = FocusNode();
                  // final FocusNode _email_addressFocus = FocusNode();

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
                                          _registerStep3( simbaDesktopController, );
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
                                          color: Color.fromARGB(255, 2, 93, 13),
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
                                                      _selectedStepIndex = 6;
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