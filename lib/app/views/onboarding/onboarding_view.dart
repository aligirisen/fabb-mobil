import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/views/auth%20pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:fabb_mobil/app/controllers/onboarding/onboarding_controller.dart';

import '../../routes/app_pages.dart';

class OnboardingPageView extends StatelessWidget {
  final controller = OnboardingController();

  OnboardingPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => controller.isFirstSeen.value
            ? buildOnboardingScreen()
            : LoginView(),
      ),
    );
  }

  Container dotsContainer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      height: 4.h,
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
          fixedSize: MaterialStateProperty.all(Size(30.w, 8.h)),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ))),
      onPressed: () {
        Get.toNamed(Routes.signup);
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
        Get.toNamed(Routes.login);
      },
      child: Text(
        "Let's get started",
        style: TextStyle(color: AppColors.mainColor),
      ),
    );
  }

  Widget buildOnboardingScreen() {
    return SafeArea(
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
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 9.w,
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
                          SizedBox(
                            height: 4.h,
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
    );
  }
}
