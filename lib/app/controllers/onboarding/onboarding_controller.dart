import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/onborading_model.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_images.dart';
import '../../theme/app_strings.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  final box = GetStorage();
  var isFirstSeen = true.obs;

  @override
  void onInit() {
    super.onInit();

    checkFirstSeen();
  }

  void checkFirstSeen() {
    isFirstSeen.value = box.read('firstSeen') ?? true;
  }

  void setFirstSeen() {
    box.write('firstSeen', false);
    isFirstSeen.value = false;
  }

  forwardAction() {
    if (isLastPage) {
      Get.toNamed(Routes.login);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      AppImages.firstBoardingImage,
      AppStrings.firstInfoTitle,
      AppStrings.firstInfoText,
    ),
    OnboardingModel(
      AppImages.secondBoardingImage,
      AppStrings.secondInfoTitle,
      AppStrings.secondInfoText,
    ),
    OnboardingModel(
      AppImages.thirdBoardingImage,
      AppStrings.thirdInfoTitle,
      AppStrings.thirdInfoText,
    ),
  ];
}
