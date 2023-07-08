import 'package:deliveryfood/controllers/cart_controller.dart';
import 'package:deliveryfood/controllers/popular_product_controller.dart';
import 'package:deliveryfood/pages/home/main_food_page.dart';
import 'package:deliveryfood/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;
  PopularFoodDetails({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.baseUrl +
                          AppConstants.uploadUrl +
                          product.img!,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => MainFoodPage(),
                      );
                    },
                    child: AppIconWidget(
                      icon: Icons.arrow_back,
                    ),
                  ),
                  AppIconWidget(
                    icon: Icons.shopping_cart_outlined,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 330,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumnWidget(
                      text: product.name!,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BigText(
                      text: "Introduce",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                          text: product.description!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
              height: 120,
              padding: EdgeInsets.only(
                top: 30,
                bottom: 30,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        BigText(
                          text: popularProduct.quantity.toString(),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        popularProduct.addItem(product);
                      },
                      child: BigText(
                        text: "${product.price!}0 DH Add To Cart",
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
