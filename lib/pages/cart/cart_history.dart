import 'package:deliveryfood/utils/colors.dart';
import 'package:deliveryfood/widgets/app_icon.dart';
import 'package:deliveryfood/widgets/big_text.dart';
import 'package:flutter/material.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: 100,
            padding: EdgeInsets.only(
              top: 45,
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
        ],
      ),
    );
  }
}
