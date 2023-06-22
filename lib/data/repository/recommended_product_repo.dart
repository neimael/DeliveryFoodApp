import 'package:deliveryfood/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.recommendedProductUri);
  }
}
