import 'package:deliveryfood/controllers/popular_product_controller.dart';
import 'package:deliveryfood/data/api/api_client.dart';
import 'package:deliveryfood/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/constants.dart';

Future<void> init() async {
  Get.lazyPut(
    () => ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"),
  );

  Get.lazyPut(
    () => PopularProductRepo(
      apiClient: Get.find(),
    ),
  );

  Get.lazyPut(
    () => PopularProductController(
      popularProductRepo: Get.find(),
    ),
  );
}
