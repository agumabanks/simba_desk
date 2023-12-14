import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simbadesketop/controller/profile_screen_controller.dart';
import 'package:simbadesketop/controller/splash_controller.dart';
import 'package:simbadesketop/data/model/response/user_info.dart';
import 'package:simbadesketop/util/dimensions.dart';
import 'package:simbadesketop/util/images.dart';
import 'package:simbadesketop/util/styles.dart';
import 'package:simbadesketop/view/base/custom_image.dart';
import 'package:simbadesketop/view/base/custom_ink_well.dart';
import 'package:simbadesketop/view/screens/kyc_verify/kyc_verify_screen.dart';
import 'package:simbadesketop/view/screens/profile/widget/bootom_sheet.dart';

import 'profile_shimmer.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ProfileController>(
      builder: (profileController) =>
      profileController.isLoading ? const ProfileShimmer() :
      Container(
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeLarge,
          vertical: Dimensions.paddingSizeLarge,
        ), 
        child: Text("hello"), ),
    );
  }
}
