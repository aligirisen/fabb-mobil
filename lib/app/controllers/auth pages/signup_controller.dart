import 'package:fabb_mobil/app/models/user_model.dart';
import 'package:fabb_mobil/app/services/auth%20pages/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  RxString firstname = ''.obs;
  RxString lastname = ''.obs;
  RxString phonenumber = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

  User createUser() {
    return User(
      fullName: firstname.value + lastname.value,
      phoneNumber: phonenumber.value,
      email: email.value,
      password: password.value,
    );
  }

  Future<bool> register() async {
    print(AuthService().postRegister(createUser()));
    bool isRegistered = await AuthService().postRegister(createUser());

    if (isRegistered) {
      return true;
    } else {
      return false;
    }
  }

  late TextEditingController infoController;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    infoController = TextEditingController();
  }

  @override
  void onClose() {
    infoController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be longer than 6 characters";
    }
    return null;
  }
}
