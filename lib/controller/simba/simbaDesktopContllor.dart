
import 'package:flutter/foundation.dart';
import 'package:gallery_saver/files.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simbadesketop/data/api/api_checker.dart';
import 'package:simbadesketop/data/model/simbaProfile.dart';
import 'package:simbadesketop/data/repository/simbaRepo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:simbadesketop/util/app_constants.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/profilesScreen.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/simbaMobile.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/verification/views/nfcUserDataScreen.dart';
import 'package:simbadesketop/view/screens/asimba/profile/profileScreen.dart';



class SimbaDesktopController extends GetxController implements GetxService {
  late final SimbaRepo simbaRepo;
  final SharedPreferences sharedPreferences;
  SimbaDesktopController({required this.simbaRepo, required this.sharedPreferences});
  bool _isLoading = false;
  // String currentUserId =
  final storage = GetStorage();
  final userId =  GetStorage().read('user_id');

 



  RxBool isImagePicked = false.obs;
  RxString pickedImagePath = ''.obs;
  final ImagePicker _imagePicker = ImagePicker();

  

//  List<Profiles>? _profilesList;
  var _profilesList = <Profiles>[];
  List<Profiles>? get  profilesList => _profilesList;

  String _currentTagId = '';
  String get currentTagId => _currentTagId;

  void getTagId(String value){
    _currentTagId = value;
    update();
  }


  
  String _currentProfileId = '';
  String get currentProfileId => _currentProfileId;

  void getUserProfile(String value){
    _currentProfileId = value;
    update();
  }

 
//  NFC
  late   String tagId = '';
  final profileIdNfc = ''.obs;

  Map<String, dynamic> userNfcProfileData = {};
   final userNfcId = '';
  final userNfcUserId = '';


  void resetUserNfcDetails(){
     userNfcProfileData = {};
      tagId = '';
     final profileIdNfc = '';
    update();
  }



   // Function to set the tag ID
  void setTagId(String newTagId) {
    tagId = newTagId;
    update();
  }



Future <void> getNfcProfileData() async {
  String apiUrl  = "http://159.89.80.33:8080/get-profile/";
  
  try {
    var response = await http.get(Uri.parse('$apiUrl$tagId')) ;

   if (response.statusCode == 200) {
        profileIdNfc.value = response.body;
        print("Profile ID retrieved successfully: $profileIdNfc");
      
      } else {
        print("Error retrieving profile ID: ${response.body}");
      }
    } catch (e) {
      print("Error sending request: $e");
    }


    // now call the profile data with the new profile id
    try {
      
      // profile url
      if (profileIdNfc.value != Null){
          fetchUserNfcData(profileIdNfc.value);
      }
    } catch (e) {
      print(e); 
    }
}



  bool hasNfcData = false;

  Future<void> fetchUserNfcData(String profileId) async {
    final String apiUserUrl = "http://159.89.80.33:8080/getuser?user_id=";


    try {
      final response = await http.get(Uri.parse('$apiUserUrl$profileId'));
      if (response.statusCode == 200) {
        // Parse the JSON response
        userNfcProfileData = json.decode(response.body);
        hasNfcData = true;

        Get.to(nfcUserDataScreen(),);
        print("user userNfcProfileData: ${userNfcProfileData}");
       
      } else {
        print('Failed to load user data. Status code: ${response.statusCode}');
      }

    } catch (e) {
      print('Error fetching user data: $e');
    }
  }



  Future<void> pickImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImagePath.value = image.path;
      isImagePicked.value = true;
    }
  }

  Future<void> CurrentUserId(profileId) async {

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('CurrentProfileId', profileId);                                                  
  }


  void getProfilesList() async {

    _profilesList = <Profiles>[];
    const String urlMain = "${AppConstants.mainUrls}getallusers";
    final response =
        await http.get(Uri.parse(urlMain)); 
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body) as List;
      _profilesList = decodedData.map((e) => Profiles.fromJson(e)).toList();
      update();

    } else {
      if (kDebugMode) {
        print('Failed to fetch users');
      }
    }
  }

final List<String> congoProvinces = [
  'Bas-Uele',
  'Haut-Uele',
  'Ituri',
  'Tshopo',
  'Nord-Ubangi',
  'Sud-Ubangi',
  'Équateur',
  'Tshuapa',
  'Mongala',
  'Nord-Kivu',
  'Maniema',
  'Sud-Kivu',
  'Tanganyika',
  'Haut-Lomami',
  'Haut-Uele',
  'Kasai',
  'Kasaï-Central',
  'Kasaï-Oriental',
  'Sankuru',
  'Maniema',
  'Sud-Kasai',
  'Tanganyika',
  'Haut-Lomami',
  'Ituri',
  'Tshuapa',
  'Tshopo',
];

static const List<String> bloodTypes = [
  'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-',
];

static const List<String> maritalStatus = [
 'Yes', 'No'
];


 // API endpoint URL
  final String apiUrl = "http://159.89.80.33:8080/getuser?user_id=";

  Map<String, dynamic> userProfileData = {};

  void resetUserDetails(){
    userProfileData = {};
    String _currentProfileId = '';
    update();
  }

  bool hasData = false;

  Future<void> fetchUserData(String profileId) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl$profileId'));
      if (response.statusCode == 200) {
        // Parse the JSON response
        userProfileData = json.decode(response.body);
        hasData = true;
        print("${userProfileData}");
       
      } else {
        print('Failed to load user data. Status code: ${response.statusCode}');
      }

      Get.to(KycProfileScreen2(),);
      // Get.to() => 
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> deletProfile(String userId) async {
    const String url = "${AppConstants.mainUrls}deleteuser?user_id=";
    try{
      final response = await http.get(Uri.parse('$url$userId'));

      if (response.statusCode == 200){
        getProfilesList();
        // Get.to(ProfilesScreen());
        Get.to(() => ProfilesScreen());
      }
    } catch (e){
      print('error deleting user $e');
    }

  }


// registration
// Future<ResponseModel> registration(SignUpBody signUpBody) async {
//     _isLoading = true;
//     update();
//     Response response = await authRepo.registration(signUpBody);
//     ResponseModel responseModel;
//     if (response.statusCode == 200) {
//       if(!Get.find<SplashController>().configModel!.customerVerification!) {
//         authRepo.saveUserToken(response.body["token"]);
//         await authRepo.updateToken();
//         Get.find<UserController>().getUserInfo();
//       }
//       responseModel = ResponseModel(true, response.body["token"]);
//     } else {
//       responseModel = ResponseModel(false, response.statusText);
//     }
//     _isLoading = false;
//     update();
//     return responseModel;
//   }

  Future getProfilesList3()async{
      
      final response = await simbaRepo.getProfilesData();
      if (response.statusCode == 200) {
         var decodedData = jsonDecode(response.body) as List;
        _profilesList = decodedData.map((e) => Profiles.fromJson(e)).toList();
        update();

      _isLoading = false;
      update();
    }
  } 


  Future<void> registerUser(Profiles profiles) async {
    const String url = "${AppConstants.mainUrls}registerpersional"; //registerpersional
    final Map<String, dynamic> parameters = profiles.toJson();


    final Uri uri = Uri.parse(url).replace(queryParameters: parameters);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      
        final parsedJson = json.decode(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_id', parsedJson['user_id']);
      // Handle success
      if (kDebugMode) {
        print("Success: ${response.body}");
        String userId2 = prefs.getString('user_id') ?? '';
        print(userId2);


      }
    } else {
      // Handle failure
      if (kDebugMode) {
        print("Failure: ${response.body}");
      }
    }
  }

// step 2
 Future<void> registerUserS2(Profiles profiles) async {
    const String url = "${AppConstants.mainUrls}updateAdditionalInfo";
    final Map<String, dynamic> parameters = profiles.toJson();


    final Uri uri = Uri.parse(url).replace(queryParameters: parameters);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      
        final parsedJson = json.decode(response.body);
        
      // Handle success
      if (kDebugMode) {

         SharedPreferences prefs = await SharedPreferences.getInstance();
         String userId2 = prefs.getString('user_id') ?? '';
        print(userId2);

      }
    } else {
      // Handle failure
      if (kDebugMode) {
        print("Failure: ${response.body}");
      }
    }
  }

// registerUserS3 registerUserS4
Future<void> registerUserS3(Profiles profiles) async {
    const String url = "${AppConstants.mainUrls}updatecontactInfo";
    final Map<String, dynamic> parameters = profiles.toJson();


    final Uri uri = Uri.parse(url).replace(queryParameters: parameters);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      
        final parsedJson = json.decode(response.body);
        storage.write('user_id', parsedJson['user_id']);

      // Handle success
      if (kDebugMode) {
        print("Success: ${response.body}");
      }
    } else {
      // Handle failure
      if (kDebugMode) {
        print("Failure: ${response.body}");
      }
    }
  }

Future<void> registerUserS4(Profiles profiles) async {
    const String url = "${AppConstants.mainUrls}updateemplotInfo";
    final Map<String, dynamic> parameters = profiles.toJson();


    final Uri uri = Uri.parse(url).replace(queryParameters: parameters);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      
        final parsedJson = json.decode(response.body);
        storage.write('user_id', parsedJson['user_id']);

      // Handle success
      if (kDebugMode) {
        print("Success: ${response.body}");
      }
    } else {
      // Handle failure
      if (kDebugMode) {
        print("Failure: ${response.body}");
      }
    }
  }

Future<void> registerUserS5(Profiles profiles) async {
    const String url = "${AppConstants.mainUrls}updateDetailedUserInfo";
    final Map<String, dynamic> parameters = profiles.toJson();


    final Uri uri = Uri.parse(url).replace(queryParameters: parameters);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      
        final parsedJson = json.decode(response.body);
        storage.write('user_id', parsedJson['user_id']);

      // Handle success
      if (kDebugMode) {
        print("Success: ${response.body}");
      }
    } else {
      // Handle failure
      if (kDebugMode) {
        print("Failure: ${response.body}");
      }
    }
  }

Future<void> registerUserS6(Profiles profiles) async {
    const String url = "${AppConstants.mainUrls}kycphotos";
    final Map<String, dynamic> parameters = profiles.toJson();



    final Uri uri = Uri.parse(url).replace(queryParameters: parameters);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      
        final parsedJson = json.decode(response.body);
        storage.write('user_id', parsedJson['user_id']);

      // Handle success
      if (kDebugMode) {
        print("Success: ${response.body}");
      }
    } else {
      // Handle failure
      if (kDebugMode) {
        print("Failure: ${response.body}");
      }
    }
  }

Future<void> registerUserS(Profiles profiles) async {
    const String url = "${AppConstants.mainUrls}kycphotos";
    final Map<String, dynamic> parameters = profiles.toJson();



    final Uri uri = Uri.parse(url).replace(queryParameters: parameters);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      
        final parsedJson = json.decode(response.body);
        storage.write('user_id', parsedJson['user_id']);

      // Handle success
      if (kDebugMode) {
        print("Success: ${response.body}");
      }
    } else {
      // Handle failure
      if (kDebugMode) {
        print("Failure: ${response.body}");
      }
    }
  }

}