import 'package:flutter/material.dart';


import 'dart:async';
import 'dart:io' show Platform, sleep;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ndef/ndef.dart' as ndef;
import 'package:ndef/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simbadesketop/controller/simba/simbaDesktopContllor.dart';

import '../ndef_record/text_record_setting.dart';
import '../ndef_record/raw_record_setting.dart';
import '../ndef_record/text_record_setting.dart';
import '../ndef_record/uri_record_setting.dart';



import 'dart:convert';
import 'package:http/http.dart' as http;




class AddNfcData extends StatefulWidget {
  @override
  _AddNfcDataState createState() => _AddNfcDataState();
}

class _AddNfcDataState extends State<AddNfcData> with SingleTickerProviderStateMixin {
  String _platformVersion = '';
  NFCAvailability _availability = NFCAvailability.not_supported;
  NFCTag? _tag;
  String? _result, _writeResult, _mifareResult;
  late TabController _tabController;
  List<ndef.NDEFRecord>? _records;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (!kIsWeb)
      _platformVersion =
          '${Platform.operatingSystem} ${Platform.operatingSystemVersion}';
    else
      _platformVersion = 'Web';
    initPlatformState();
    _tabController = TabController(length: 2, vsync: this);
    _records = [];
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    NFCAvailability availability;
    try {
      availability = await FlutterNfcKit.nfcAvailability;
    } on PlatformException {
      availability = NFCAvailability.not_supported;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
      _availability = availability;
    });
  }

final SimbaDesktopController simbaController = Get.put(SimbaDesktopController(simbaRepo: Get.find(), sharedPreferences: Get.find()));

  
  Future<void> addTagData() async {
  String apiUrl =   "http://159.89.80.33:8080/addtag"; 
  
  try {
      String CurrentProfileId = simbaController.currentProfileId;
      String TagId = simbaController.currentTagId;
      var response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"tag_id": TagId, "user_id": CurrentProfileId}),
    );

    if (response.statusCode == 200) {
      print("Tag data added successfully");
        // final parsedJson = json.decode(response.body);
        Get.back();
     
    } else {
      print("Error adding tag data: ${response.body}");
    }
  } catch (e) {
    print("Error sending request: $e");
  }
}

Future<void> getTagData() async{
  String apiUrl = 'http://159.89.80.33:8080/get-profile'; //http://159.89.80.33:8080/get-profile/041726CAD41890
  try {
      
      //  print(userId2);
      // String CurrentProfileId = simbaController.currentProfileId;
      // String TagId = simbaController.currentTagId;
      var response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode('{"tag_id": "041726CAD41890"}'),
    );

    if (response.statusCode == 200) {
      print("Tag data added successfully");
      if (kDebugMode) {
        print("${response.body}");
      }
        // final parsedJson = json.decode(response.body);
     
    } else {
      print("Error adding tag data: ${response.body}");
    }
  } catch (e) {
    print("Error sending request: $e");
  }
}


Future<void> _getProfile() async {
    String apiUrl = "http://159.89.80.33:8080/get-profile";

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"tag_id": "041726CAD41890"}),
      );



      if (response.statusCode == 200) {
        
        print("Tag data added successfully");
      if (kDebugMode) {
        print("${response.body}");
      }
        // final parsedJson = json.decode(response.body);
     
      } else {
        print("Error adding tag data: ${response.body}");
      }
    } catch (e) {
      print("Error sending request: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Scrollbar(
                child: Container(
                  height: Get.height, width: Get.width, color: const Color(0xFF162231),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Container(
                        // color: gray,

                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 231, 231),
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),

                        child: Center(
                            child: Column( 
                                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                        const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('NFC: '),
                              Text(' $_availability'),
                            ],
                          ), // Running on: $_platformVersion\n
                                        // const SizedBox(height: 10),
                              
                                        
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: Get.height /3,
                           decoration: BoxDecoration(
                            color: Color.fromARGB(222, 142, 142, 142),
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),



                          width: Get.width / 3,
                          child:   Center(
                            child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: _tag != null
                                ? Text( 'ID: ${_tag!.id}\n' , style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,), )
                                : const Text('No tag polled yet.')
                                
                                ),
                          ),
                        ),
                     ),
                                        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  NFCTag tag = await FlutterNfcKit.poll();
                                  setState(() {
                                    _tag = tag;
                                  });
                                  await FlutterNfcKit.setIosAlertMessage(
                                      "Working on it...");
                                  _mifareResult = null;
                                  if (tag.standard == "ISO 14443-4 (Type B)") {
                                    String result1 =
                                        await FlutterNfcKit.transceive("00B0950000");
                                    String result2 = await FlutterNfcKit.transceive(
                                        "00A4040009A00000000386980701");
                                       
                                    setState(() {
                                      _result = '1: $result1\n2: $result2\n';
                                    });
                                    //  print("${_tag!.id}");
                                  } else if (tag.type == NFCTagType.iso18092) {
                                    String result1 =
                                        await FlutterNfcKit.transceive("060080080100");
                            
                                    setState(() {
                                      _result = '1: $result1\n';
                                    });
                                    
                                     print("${_tag!.id}");
                                  } else if (tag.ndefAvailable ?? false) {
                                    var ndefRecords = await FlutterNfcKit.readNDEFRecords();
                                    var ndefString = '';
                                    for (int i = 0; i < ndefRecords.length; i++) {
                                      ndefString += '${i + 1}: ${ndefRecords[i]}\n';
                                    }
                                    setState(() {
                                      _result = ndefString;
                                    });
                                    
                                     
                                  } else if (tag.type == NFCTagType.webusb) {
                                    var r = await FlutterNfcKit.transceive(
                                        "00A4040006D27600012401");
                                    if (kDebugMode) {
                                      print(r);
                                    }
                                  }
                                } catch (e) {
                                  setState(() {
                                    _result = 'error: $e';
                                  });
                                }
                                  if (kDebugMode) {
                                    print("ID: ${_tag!.id}\nStandard: ${_tag!.standard}\nType: ${_tag!.type}\nATQA: ${_tag!.atqa}\nSAK: ${_tag!.sak}\nHistorical Bytes: ${_tag!.historicalBytes}\nProtocol Info: ${_tag!.protocolInfo}\nApplication Data: ${_tag!.applicationData}\nHigher Layer Response: ${_tag!.hiLayerResponse}\nManufacturer: ${_tag!.manufacturer}\nSystem Code: ${_tag!.systemCode}\nDSF ID: ${_tag!.dsfId}\nNDEF Available: ${_tag!.ndefAvailable}\nNDEF Type: ${_tag!.ndefType}\nNDEF Writable: ${_tag!.ndefWritable}\nNDEF Can Make Read Only: ${_tag!.ndefCanMakeReadOnly}\nNDEF Capacity: ${_tag!.ndefCapacity}\nMifare Info:${_tag!.mifareInfo} Transceive Result:\n$_result\n\nBlock Message:\n$_mifareResult");
                                  }
                                    
                                  // String CurrentProfileId = simbaController.currentProfileId;
                                   simbaController.getTagId(_tag!.id);
                               
                                // Pretend that we are working
                                if (!kIsWeb) sleep(const Duration(seconds: 1));
                                await FlutterNfcKit.finish(iosAlertMessage: "Finished!");
                              },
                              child: const Text('Start polling'),
                                              ),
                          ),
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: (){
                                            // print("hello b");
                                            // simbaController.setTagId("041726CAD41890");
                                            // simbaController.getNfcProfileData() ;
                                             addTagData();
                                             }, 
                                          child: const Text("Add Card")),
                        ),
                        ],
                      ),
                                        const SizedBox(height: 10),
                          //               Padding(
                          // padding: const EdgeInsets.symmetric(horizontal: 20),
                          // child: _tag != null
                          //     ? Text( 'ID: ${_tag!.id}\n')
                          //     : const Text('No tag polled yet.')
                              
                          //     ),
                                        ]
                                       )
                                      ),
                      ),
                    )
                )
              ),
        ),
        ),
      // ),
    );
  }
}


