import 'package:flutter/foundation.dart';
import 'package:gallery_saver/files.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simbadesketop/data/api/api_checker.dart';
import 'package:simbadesketop/data/model/simbaProfile.dart';
import 'package:simbadesketop/data/repository/simbaRepo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class SimbaDesktopController extends GetxController implements GetxService {
  late final SimbaRepo simbaRepo;
  final SharedPreferences sharedPreferences;
  SimbaDesktopController({required this.simbaRepo, required this.sharedPreferences});
  bool _isLoading = false;
  // String currentUserId =
  final storage = GetStorage();
  final userId =  GetStorage().read('user_id');



//  List<Profiles>? _profilesList;
  var _profilesList = <Profiles>[];

  List<Profiles>? get profilesList => _profilesList;



  void getProfilesList() async {
    
    final response =
        await http.get(Uri.parse('http://localhost:8080/getallusers'));

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
    const String url = "http://127.0.0.1:8080/registerpersional";
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
    const String url = "http://127.0.0.1:8080/updateAdditionalInfo";
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


// registerUserS3
Future<void> registerUserS3(Profiles profiles) async {
    const String url = "http://127.0.0.1:8080/updatecontactInfo";
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