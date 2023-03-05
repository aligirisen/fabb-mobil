import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_images.dart';
import '../../../theme/app_strings.dart';
import '../models/onborading_infor_model.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.toNamed('login');
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      AppImages.firstBoardingImage,
      AppStrings.appTitle,
      AppStrings.firstInfoText,
    ),
    OnboardingInfo(
      AppImages.secondBoardingImage,
      AppStrings.appTitle,
      AppStrings.firstInfoText,
    ),
    OnboardingInfo(
      AppImages.thirdBoardingImage,
      AppStrings.appTitle,
      AppStrings.firstInfoText,
    ),
  ];
}
