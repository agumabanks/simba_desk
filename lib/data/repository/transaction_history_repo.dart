
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:simbadesketop/data/api/api_client.dart';
import 'package:simbadesketop/util/app_constants.dart';

class TransactionHistoryRepo{
  final ApiClient apiClient;

  TransactionHistoryRepo({required this.apiClient});

  Future<Response> getTransactionHistory(int offset) async {
    return await apiClient.getData('${AppConstants.customerTransactionHistory}?limit=1000&offset=$offset');
  }
}