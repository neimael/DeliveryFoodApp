import 'package:deliveryfood/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumnWidget extends StatelessWidget {
  final String text;

  const AppColumnWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: 24,
        ),
        SizedBox(
          height: Dimensions.height10,
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
          height: Dimensions.height20,
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
    );
  }
}
