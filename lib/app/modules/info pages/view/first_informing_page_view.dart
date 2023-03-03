import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:fabb_mobil/app/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
          margin: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.symmetric(
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
            const SizedBox(
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              height: 30,
              width: 30.w,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber.shade100,
                  ),
                ),
                Container(
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber.shade100,
                  ),
                )
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //     backgroundColor: AppColors.infoTextColor),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(130, 50)),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ))),
                  onPressed: () {
                    Get.toNamed("/signup");
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: AppColors.mainColor),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(130, 50)),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ))),
                  onPressed: () {
                    Get.toNamed("/login");
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(color: AppColors.mainColor),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
