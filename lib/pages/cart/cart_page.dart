import 'package:deliveryfood/controllers/cart_controller.dart';
import 'package:deliveryfood/controllers/popular_product_controller.dart';
import 'package:deliveryfood/controllers/recommended_product_controller.dart';
import 'package:deliveryfood/pages/home/main_food_page.dart';
import 'package:deliveryfood/routes/route_helper.dart';
import 'package:deliveryfood/utils/colors.dart';
import 'package:deliveryfood/utils/constants.dart';
import 'package:deliveryfood/widgets/app_icon.dart';
import 'package:deliveryfood/widgets/big_text.dart';
import 'package:deliveryfood/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/no_data_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 60,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MainFoodPage());
                    },
                    child: AppIconWidget(
                      icon: Icons.arrow_back,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: 24,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIconWidget(
                      icon: Icons.home,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: 24,
                    ),
                  ),
                  AppIconWidget(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: 24,
                  ),
                ],
              ),
            ),
            GetBuilder<CartController>(
              builder: (_cartController) {
                return _cartController.getItems.length > 0
                    ? Positioned(
                        top: 110,
                        left: 20,
                        right: 20,
                        bottom: 0,
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: GetBuilder<CartController>(
                                builder: (CartController) {
                                  var _cartList = CartController.getItems;
                                  return ListView.builder(
                                    itemCount: _cartList.length,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        height: 100,
                                        width: double.maxFinite,
                                        margin: EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                var popularIndex = Get.find<
                                                        PopularProductController>()
                                                    .popularProductList
                                                    .indexOf(_cartList[index]
                                                        .product!);
                                                if (popularIndex >= 0) {
                                                  Get.toNamed(RouteHelper
                                                      .getPopularFood(
                                                          popularIndex,
                                                          "cartPage"));
                                                } else {
                                                  var recommendedIndex = Get.find<
                                                          RecommendedProductController>()
                                                      .recommendedProductList
                                                      .indexOf(_cartList[index]
                                                          .product!);
                                                  if (recommendedIndex < 0) {
                                                    Get.snackbar(
                                                      "History product",
                                                      "Product review is not available for history products !",
                                                      backgroundColor:
                                                          AppColors.mainColor,
                                                      colorText: Colors.white,
                                                    );
                                                  } else {
                                                    Get.toNamed(RouteHelper
                                                        .getRecommendedFood(
                                                            recommendedIndex,
                                                            "cartPage"));
                                                  }
                                                }
                                              },
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        AppConstants.baseUrl +
                                                            AppConstants
                                                                .uploadUrl +
                                                            CartController
                                                                .getItems[index]
                                                                .img!),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 100,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    BigText(
                                                      text: CartController
                                                          .getItems[index]
                                                          .name!,
                                                      color: Colors.black54,
                                                    ),
                                                    SmallText(
                                                      text: "Spicy",
                                                      size: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        BigText(
                                                          text:
                                                              "${CartController.getItems[index].price!}0 DH",
                                                          color:
                                                              Colors.redAccent,
                                                          size: 18,
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10,
                                                            left: 10,
                                                            right: 10,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              20,
                                                            ),
                                                            color: Colors.white,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  CartController.addItem(
                                                                      _cartList[
                                                                              index]
                                                                          .product!,
                                                                      -1);
                                                                },
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  size: 18,
                                                                  color: AppColors
                                                                      .signColor,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              BigText(
                                                                text: _cartList[
                                                                        index]
                                                                    .quantity
                                                                    .toString(),
                                                                size: 18,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  CartController.addItem(
                                                                      _cartList[
                                                                              index]
                                                                          .product!,
                                                                      1);
                                                                },
                                                                child: Icon(
                                                                  Icons.add,
                                                                  size: 18,
                                                                  color: AppColors
                                                                      .signColor,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              )),
                        ),
                      )
                    : NoDataPage(text: "Your cart is empty !");
              },
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (CartController) {
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
              child: CartController.getItems.length > 0
                  ? Row(
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
                              SizedBox(
                                width: 5,
                              ),
                              BigText(
                                text: CartController.totalAmount.toString() +
                                    " DH",
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            CartController.addToHistory();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                              left: 20,
                              right: 20,
                            ),
                            child: BigText(
                              text: "Check Out",
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            );
          },
        ));
  }
}
