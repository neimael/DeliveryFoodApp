import 'package:deliveryfood/utils/colors.dart';
import 'package:deliveryfood/widgets/big_text.dart';
import 'package:deliveryfood/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../widgets/icon_and_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(
    viewportFraction: 0.9,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          itemCount: 5,
          controller: pageController,
          itemBuilder: ((context, position) {
            return _buildPageItem(position);
          })),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(
            left: 7,
            right: 7,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/image/food0.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) {
                            return Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "4.5",
                        size: 16,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "1287",
                        size: 16,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "Comment",
                        size: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                        text: "Normal",
                        icon: Icons.circle_sharp,
                        iconColor: AppColors.iconColor1,
                      ),
                      IconAndTextWidget(
                        text: "1.7 km",
                        icon: Icons.location_on,
                        iconColor: AppColors.mainColor,
                      ),
                      IconAndTextWidget(
                        text: "32 min",
                        icon: Icons.access_time_rounded,
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
