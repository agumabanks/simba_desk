import 'package:flutter/material.dart';
import 'package:simbadesketop/data/model/response/language_model.dart';
import 'package:simbadesketop/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext? context}) {
    return AppConstants.languages;
  }
}
