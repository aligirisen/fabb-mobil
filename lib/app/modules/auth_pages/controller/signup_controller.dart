import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  late TextEditingController infoController;

  @override
  void onInit() {
    super.onInit();
    infoController = TextEditingController();
  }
}
