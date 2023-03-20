import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:fabb_mobil/app/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swipe/swipe.dart';
import 'package:fabb_mobil/app/modules/0-onboarding/controllers/onboarding_controller.dart';

class OnboardingPageView extends StatelessWidget {
  final controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.selectedPageIndex,
            itemCount: controller.onboardingPages.length,
            itemBuilder: (context, index) => Container(
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
                              vertical: 40,
                            ),
                            height: 40.h,
                            child: controller.onboardingPages[index].image,
                          ),
                          Text(
                            controller.onboardingPages[index].title,
                            style: TextStyle(
                                color: AppColors.infoTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            controller.onboardingPages[index].text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.infoTextColor,
                              fontSize: 16,
                            ),
                          ),
                          dotsContainer(),
                        ]),
                  ),
                )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              startButton(),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ]),
    ));
  }

  Container dotsContainer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      height: 30,
      width: 30.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.onboardingPages.length,
          (index) => Obx(() {
            return Container(
              margin: const EdgeInsets.all(4),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: controller.selectedPageIndex.value == index
                    ? Colors.amber
                    : Colors.amber.shade100,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ),
    );
  }

  ElevatedButton signupButton() {
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
        Get.toNamed("/signup");
      },
      child: Text(
        "Sign Up",
        style: TextStyle(color: AppColors.mainColor),
      ),
    );
  }

  ElevatedButton startButton() {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(150, 50)),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ))),
      onPressed: () {
        Get.toNamed("/login");
      },
      child: Text(
        "Let's get started",
        style: TextStyle(color: AppColors.mainColor),
      ),
    );
  }
}
