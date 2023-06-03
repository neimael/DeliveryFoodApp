import 'package:deliveryfood/utils/colors.dart';
import 'package:deliveryfood/widgets/app_icon.dart';
import 'package:deliveryfood/widgets/big_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/expandable_text.dart';

class RecommandedFoodDetails extends StatelessWidget {
  const RecommandedFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIconWidget(icon: Icons.clear),
                AppIconWidget(icon: Icons.shopping_cart_outlined),
              ],
            ),
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(
                    text: "Chinese Side",
                    size: 26,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            expandedHeight: 300,
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  ExpandableTextWidget(
                    text:
                        "Introducing our new app, designed to revolutionize the way you manage your daily tasks and stay organized. With our app, you can effortlessly plan your schedule, set reminders, and keep track of all your important deadlines. The intuitive user interface makes navigation a breeze, allowing you to easily create and categorize tasks, prioritize them, and mark them as complete. Stay on top of your commitments with customizable notifications that ensure you never miss a deadline. Our app also offers seamless integration with popular calendar platforms, enabling you to sync your events and appointments effortlessly. Take control of your productivity and streamline your life with our app, your ultimate companion for efficient task management. Download now and experience the power of organization at your fingertips. Introducing our new app, designed to revolutionize the way you manage your daily tasks and stay organized. With our app, you can effortlessly plan your schedule, set reminders, and keep track of all your important deadlines. The intuitive user interface makes navigation a breeze, allowing you to easily create and categorize tasks, prioritize them, and mark them as complete. Stay on top of your commitments with customizable notifications that ensure you never miss a deadline. Our app also offers seamless integration with popular calendar platforms, enabling you to sync your events and appointments effortlessly. Take control of your productivity and streamline your life with our app, your ultimate companion for efficient task management. Download now and experience the power of organization at your fingertips. Introducing our new app, designed to revolutionize the way you manage your daily tasks and stay organized. With our app, you can effortlessly plan your schedule, set reminders, and keep track of all your important deadlines. The intuitive user interface makes navigation a breeze, allowing you to easily create and categorize tasks, prioritize them, and mark them as complete. Stay on top of your commitments with customizable notifications that ensure you never miss a deadline. Our app also offers seamless integration with popular calendar platforms, enabling you to sync your events and appointments effortlessly. Take control of your productivity and streamline your life with our app, your ultimate companion for efficient task management. Download now and experience the power of organization at your fingertips. Introducing our new app, designed to revolutionize the way you manage your daily tasks and stay organized. With our app, you can effortlessly plan your schedule, set reminders, and keep track of all your important deadlines. The intuitive user interface makes navigation a breeze, allowing you to easily create and categorize tasks, prioritize them, and mark them as complete. Stay on top of your commitments with customizable notifications that ensure you never miss a deadline. Our app also offers seamless integration with popular calendar platforms, enabling you to sync your events and appointments effortlessly. Take control of your productivity and streamline your life with our app, your ultimate companion for efficient task management. Download now and experience the power of organization at your fingertips.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 50,
              right: 50,
              top: 10,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIconWidget(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: 24,
                ),
                BigText(
                  text: " 60 DH " + " x " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: 26,
                ),
                AppIconWidget(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
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
                    text: "60 DH Add To Cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
