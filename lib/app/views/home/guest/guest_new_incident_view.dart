import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:fabb_mobil/app/theme/app_strings.dart';
import 'package:fabb_mobil/app/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';

class GuestNewIncidentView extends StatelessWidget {
  const GuestNewIncidentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      color: AppColors.lightWords,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
          Container(
            width: 70.w,
            child: Image(
              image: AppImages.loginImage,
            ),
          ),
          Text(
            AppStrings.guestNewIncidentTitle,
            style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 18,
                fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            AppStrings.guestNewIncidentText,
            style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          loginButton(),
          orCreateAccountText()
        ],
      )),
    );
  }

  GestureDetector orCreateAccountText() {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.signup);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 45.w),
          child: Text(
            'or Create an account',
            style: TextStyle(fontSize: 11, color: AppColors.greyTextColor),
          ),
        ));
  }

  GestureDetector loginButton() {
    return GestureDetector(
      onTap: () async {
        Get.toNamed(Routes.login);
      },
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 5.h),
          height: 8.h,
          width: 90.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 66, 66, 66).withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              // border: Border.all(
              //   color:Color.fromARGB(255, 157, 157, 157),
              //   width: 1,
              // ),
              color: const Color.fromARGB(255, 255, 255, 255)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "LOGIN NOW",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 21, 54, 70)),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Icon(Icons.arrow_right)
            ],
          )),
    );
  }
}
