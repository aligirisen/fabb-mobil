import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';
import 'package:fabb_mobil/app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';
import '../../services/auth_service.dart';

class SettingsController extends GetxController {
  RxString fullname = ''.obs;
  RxString birthdate = ''.obs;
  RxString phonenumber = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString userBirthDate = ''.obs;
  RxBool isPasswordHidden = true.obs;

  late TextEditingController fullnameTEController,
      birthdateTEController,
      phoneNumberTEController,
      emailTEController,
      passwordTEController;

  static SettingsController get to => Get.find<SettingsController>();

  @override
  void onInit() {
    fullnameTEController = TextEditingController();
    birthdateTEController = TextEditingController();
    phoneNumberTEController = TextEditingController();
    passwordTEController = TextEditingController();
    emailTEController = TextEditingController();
    super.onInit();
  }

  void initialize() {
    Get.delete<SettingsController>();
    Get.put(SettingsController());
  }

  var selectedLanguage = 'English'.obs;

  void changeLanguage(String language) {
    selectedLanguage.value = language;
  }

  bool isEnglishSelected() {
    return selectedLanguage.value == 'English';
  }

  User newInfo(String accountid) {
    if (fullnameTEController.text.isEmpty) {
      fullname.value = GeneralAppDatas.fullNameSettings.value;
    } else {
      fullname.value = fullnameTEController.text;
    }
    if (birthdateTEController.text.isEmpty) {
      birthdate.value = GeneralAppDatas.birthDateSettings.value;
    } else {
      birthdate.value = birthdateTEController.text;
    }
    if (emailTEController.text.isEmpty) {
      email.value = GeneralAppDatas.userEmail.value;
    } else {
      email.value = emailTEController.text;
    }
    if (phoneNumberTEController.text.isEmpty) {
      phonenumber.value = GeneralAppDatas.phoneNumberSettings.value;
    } else {
      phonenumber.value = phoneNumberTEController.text;
    }

    if (passwordTEController.text.isNotEmpty) {
      return User(
          fullName: fullname.value,
          dateOfBirth: birthdate.value,
          phoneNumber: phonenumber.value,
          email: email.value,
          password: passwordTEController.text,
          userId: GeneralAppDatas.userId.value,
          accountId: accountid);
    } else {
      return User(
          fullName: fullname.value,
          dateOfBirth: birthdate.value,
          phoneNumber: phonenumber.value,
          email: email.value,
          userId: GeneralAppDatas.userId.value,
          accountId: accountid);
    }
  }

  Future<bool> updateUser() async {
    String accountid =
        await UserService().fetchUserData(GeneralAppDatas.userId.value);

    await Future.delayed(const Duration(milliseconds: 50));

    User user = newInfo(accountid);

    await Future.delayed(const Duration(milliseconds: 50));

    bool isUpdated = await UserService().updateUser(user);

    if (isUpdated) {
      return true;
    } else {
      return false;
    }
  }
}
