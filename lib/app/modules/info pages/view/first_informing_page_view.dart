import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_strings.dart';

class FirstInformingPageView extends StatelessWidget {
  const FirstInformingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: AppColors.infoPageBackground,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
              ),
              height: 40.h,
              child: Image(image: AppImages.firstInfoImage),
            ),
            Text(
              AppStrings.firstInfoTitle,
              style: TextStyle(
                  color: AppColors.infoTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              AppStrings.firstInfoText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.infoTextColor,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: AppColors.dotActiveColor,
                  size: 10,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
