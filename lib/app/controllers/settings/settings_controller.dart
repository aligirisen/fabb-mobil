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

  late TextEditingController nameTEController,
      birthdateTEController,
      phoneNumberTEController,
      emailTEController,
      passwordTEController;

  static SettingsController get to => Get.find<SettingsController>();

  @override
  void onInit() {
    nameTEController = TextEditingController();
    birthdateTEController = TextEditingController();
    phoneNumberTEController = TextEditingController();
    passwordTEController = TextEditingController();
    emailTEController = TextEditingController();
    super.onInit();
  }

  void initialize() {
    nameTEController = TextEditingController();
    birthdateTEController = TextEditingController();
    phoneNumberTEController = TextEditingController();
    emailTEController = TextEditingController();
    passwordTEController = TextEditingController();
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

  User createUser(String accountid) {
    if (fullname.value.isEmpty) {
      fullname.value = GeneralAppDatas.fullNameSettings.value;
    }
    if (email.value.isEmpty) {
      email.value = GeneralAppDatas.userEmail.value;
    }
    if (phonenumber.value.isEmpty) {
      phonenumber.value = GeneralAppDatas.phoneNumberSettings.value;
    }

    if (password.value.isNotEmpty) {
      return User(
          fullName: fullname.value,
          dateOfBirth: birthdate.value,
          phoneNumber: phonenumber.value,
          email: email.value,
          password: password.value,
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

    await Future.delayed(const Duration(milliseconds: 5));

    User user = createUser(accountid);

    bool isUpdated = await UserService().updateUser(user);

    if (isUpdated) {
      return true;
    } else {
      return false;
    }
  }
}
