import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simbadesketop/util/app_constants.dart';
import 'package:simbadesketop/util/dimensions.dart';

const rubikLight = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w300,
);

const rubikRegular = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
);

const rubikMedium = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
);

const rubikSemiBold = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w600,
);

final robotoRegular = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoMedium = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBold = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBlack = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeDefault,
);

final BoxDecoration riderContainerDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
  color: Theme.of(Get.context!).primaryColor.withOpacity(0.1), shape: BoxShape.rectangle,
);

