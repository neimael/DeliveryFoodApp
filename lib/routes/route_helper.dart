import 'package:deliveryfood/pages/food/popular_food_details.dart';
import 'package:deliveryfood/pages/food/recommanded_food_details.dart';
import 'package:deliveryfood/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() {
    return "$initial";
  }

  static String getPopularFood() {
    return "$popularFood";
  }

  static String getRecommendedFood() {
    return "$recommendedFood";
  }

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => MainFoodPage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        return PopularFoodDetails();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        return RecommandedFoodDetails();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
