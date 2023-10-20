import 'package:get/get_connect/http/src/response/response.dart';
import 'package:simbadesketop/data/api/api_client.dart';
import 'package:simbadesketop/util/app_constants.dart';

class BannerRepo{
  final ApiClient apiClient;

  BannerRepo({required this.apiClient});

  Future<Response> getBannerList() async {
    return await apiClient.getData(AppConstants.customerBanner);
  }
}