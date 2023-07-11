import 'package:deliveryfood/pages/food/popular_food_details.dart';
import 'package:deliveryfood/pages/food/recommanded_food_details.dart';
import 'package:deliveryfood/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/cart/cart_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getInitial() {
    return "$initial";
  }

  static String getPopularFood(int pageId) {
    return "$popularFood?pageId=$pageId";
  }

  static String getRecommendedFood(int pageId) {
    return "$recommendedFood?pageId=$pageId";
  }

  static String getCartPage() {
    return "$cartPage";
  }

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => MainFoodPage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetails(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommandedFoodDetails(
          pageId: int.parse(pageId!),
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
