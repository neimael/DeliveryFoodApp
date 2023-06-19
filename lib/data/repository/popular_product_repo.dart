import 'package:deliveryfood/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData("/api/v1/products/popular");
  }
}
