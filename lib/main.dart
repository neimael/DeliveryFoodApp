import 'package:deliveryfood/controllers/popular_product_controller.dart';
import 'package:deliveryfood/controllers/recommended_product_controller.dart';
import 'package:deliveryfood/pages/food/popular_food_details.dart';
import 'package:deliveryfood/pages/food/recommanded_food_details.dart';
import 'package:deliveryfood/pages/home/food_page_body.dart';
import 'package:deliveryfood/pages/splash/splash_page.dart';
import 'package:deliveryfood/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helpers/dependencies.dart' as dep;
import 'pages/home/main_food_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes,
            );
          },
        );
      },
    );
  }
}
