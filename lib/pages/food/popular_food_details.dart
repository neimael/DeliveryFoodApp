import 'package:deliveryfood/pages/home/main_food_page.dart';
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
  const PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(
                    "assets/image/food0.png",
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
                    text: "Chinese Side",
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
                        text:
                            "Introducing our new app, designed to revolutionize the way you manage your daily tasks and stay organized. With our app, you can effortlessly plan your schedule, set reminders, and keep track of all your important deadlines. The intuitive user interface makes navigation a breeze, allowing you to easily create and categorize tasks, prioritize them, and mark them as complete. Stay on top of your commitments with customizable notifications that ensure you never miss a deadline. Our app also offers seamless integration with popular calendar platforms, enabling you to sync your events and appointments effortlessly. Take control of your productivity and streamline your life with our app, your ultimate companion for efficient task management. Download now and experience the power of organization at your fingertips.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: AppColors.mainColor,
              ),
              child: BigText(
                text: "80 DH Add To Cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
