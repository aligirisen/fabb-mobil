import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:fabb_mobil/app/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../routes/app_pages.dart';

class SuccessfullyReportedView extends StatelessWidget {
  const SuccessfullyReportedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Container(
          height: 100.h,
          width: 100.w,
          color: AppColors.infoPageBackground,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    height: 40.h,
                    child: Image(image: AppImages.successful),
                  ),
                  Text(
                    AppStrings.successfulTitle,
                    style: TextStyle(
                        color: AppColors.infoTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    AppStrings.successfulText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.infoTextColor,
                      fontSize: 16,
                    ),
                  ),
                ]),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.home);
            },
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                )),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              seeReportButton(),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ]),
    ));
  }

  ElevatedButton seeReportButton() {
    return ElevatedButton(
      // style: ElevatedButton.styleFrom(
      //     backgroundColor: AppColors.infoTextColor),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(130, 50)),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ))),
      onPressed: () {
        Get.toNamed(Routes.myreports); //my reports sayfasına gidecek
      },
      child: Text(
        "See the Report",
        style: TextStyle(color: AppColors.mainColor),
      ),
    );
  }
}
