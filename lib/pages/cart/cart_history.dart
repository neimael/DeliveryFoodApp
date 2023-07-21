import 'dart:convert';

import 'package:deliveryfood/controllers/cart_controller.dart';
import 'package:deliveryfood/models/cart_model.dart';
import 'package:deliveryfood/routes/route_helper.dart';
import 'package:deliveryfood/utils/colors.dart';
import 'package:deliveryfood/utils/constants.dart';
import 'package:deliveryfood/widgets/app_icon.dart';
import 'package:deliveryfood/widgets/big_text.dart';
import 'package:deliveryfood/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> orderTimes = cartItemsPerOrderToList();
    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: 90,
            padding: EdgeInsets.only(
              top: 35,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                AppIconWidget(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      for (var i = 0; i < cartItemsPerOrder.length; i++)
                        Container(
                          height: 120,
                          margin: EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (() {
                                DateTime parseDate =
                                    DateFormat("yyy-MM-dd HH:mm:ss").parse(
                                        getCartHistoryList[listCounter].time!);
                                var outputFormat =
                                    DateFormat("MM/dd/yyyy hh:mm a");
                                var outputDate = outputFormat.format(parseDate);
                                return BigText(
                                  text: outputDate,
                                  size: 18,
                                );
                              }()),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(
                                      orderTimes[i],
                                      (index) {
                                        if (listCounter <
                                            getCartHistoryList.length) {
                                          listCounter++;
                                        }
                                        return index <= 2
                                            ? Container(
                                                height: 80,
                                                width: 80,
                                                margin: EdgeInsets.only(
                                                  right: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          AppConstants.baseUrl +
                                                              AppConstants
                                                                  .uploadUrl +
                                                              getCartHistoryList[
                                                                      listCounter -
                                                                          1]
                                                                  .img!)),
                                                ),
                                              )
                                            : Container();
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SmallText(
                                          text: "Total",
                                          color: AppColors.titleColor,
                                        ),
                                        BigText(
                                          text: orderTimes[i].toString() +
                                              " Items",
                                          color: AppColors.titleColor,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            var orderTime =
                                                cartOrderTimeToList();
                                            Map<int, CartModel> moreOrder = {};
                                            for (var j = 0;
                                                j < getCartHistoryList.length;
                                                j++) {
                                              if (getCartHistoryList[j].time ==
                                                  orderTime[i]) {
                                                moreOrder.putIfAbsent(
                                                  getCartHistoryList[j].id!,
                                                  () => CartModel.fromJson(
                                                    jsonDecode(
                                                      jsonEncode(
                                                        getCartHistoryList[j],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            }
                                            Get.find<CartController>()
                                                .setItems = moreOrder;
                                            Get.find<CartController>()
                                                .addToCartList();
                                            Get.toNamed(
                                              RouteHelper.getCartPage(),
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                width: 1,
                                                color: AppColors.mainColor,
                                              ),
                                            ),
                                            child: SmallText(
                                              text: "One more",
                                              color: AppColors.mainColor,
                                            ),
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
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
