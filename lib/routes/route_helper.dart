import 'package:deliveryfood/pages/food/popular_food_details.dart';
import 'package:deliveryfood/pages/food/recommanded_food_details.dart';
import 'package:deliveryfood/pages/home/home_page.dart';
import 'package:deliveryfood/pages/home/main_food_page.dart';
import 'package:deliveryfood/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/cart/cart_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage() {
    return "$splashPage";
  }

  static String getInitial() {
    return "$initial";
  }

  static String getPopularFood(int pageId, String page) {
    return "$popularFood?pageId=$pageId&page=$page";
  }

  static String getRecommendedFood(int pageId, String page) {
    return "$recommendedFood?pageId=$pageId&page=$page";
  }

  static String getCartPage() {
    return "$cartPage";
  }

  static List<GetPage> routes = [
    GetPage(
      name: splashPage,
      page: () => SplashPage(),
    ),
    GetPage(
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetails(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommandedFoodDetails(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () => CartPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
