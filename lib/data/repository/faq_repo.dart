import 'package:get/get_connect/http/src/response/response.dart';
import 'package:simbadesketop/data/api/api_client.dart';
import 'package:simbadesketop/util/app_constants.dart';

class FaqRepo{
  final ApiClient apiClient;

  FaqRepo({required this.apiClient});

  Future<Response> getFaqList() async {
    return await apiClient.getData(AppConstants.faqUri);
  }
}