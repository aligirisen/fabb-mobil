import 'package:fabb_mobil/app/services/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../general_app_datas/general_app_datas.dart';
import '../../services/user_service.dart';

class LoginController extends GetxController {
  RxString displayText = 'Enter a password'.obs;
  RxDouble passwordStrength = 0.0.obs;
  RegExp numRegExpress = RegExp(r".*[0-9].*");
  RegExp letterRegExpress = RegExp(r".*[A-Za-z].*");
  RxBool isPasswordHidden = true.obs;
  RxString falseLogin = ''.obs;

  RxString password = ''.obs;
  RxString email = ''.obs;

  //global key, create account butonuna basıldığında Get.deleteall(controller)

  // late GlobalKey<FormState> loginFormKey;
  late TextEditingController emailController, passwordController;

  static LoginController get to => Get.find<LoginController>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    //loginFormKey = GlobalKey<FormState>();
    checkLoggedInStatus();
  }

  void checkLoggedInStatus() {
    GeneralAppDatas.isLoggedIn.value =
        GeneralAppDatas.box.read('isLoggedIn') ?? false;
  }

  void initialize() {
    // Controller'ı yeniden başlatmak için bu metodu çağırın
    emailController = TextEditingController();
    passwordController = TextEditingController();
    Get.delete<LoginController>();
    Get.put(LoginController());
  }

  @override
  void onClose() {
    emailController.text = "";
    passwordController.text = "";
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
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

  bool checkLogin() {
    //final isValid = true;
    // loginFormKey.currentState!.validate();
    // if (!isValid) {
    //   return false;
    // } else {
    //   loginFormKey.currentState!.save();
    //   return true;
    // }
    return true;
  }

  Future<bool> loginService(String email, String password) async {
    bool isLogged = await AuthService().login(email, password);
    if (isLogged == true) {
      GeneralAppDatas.isLoggedIn.value = true;
      GeneralAppDatas.box.write('isLoggedIn', true);
      GeneralAppDatas.box.write('userId', GeneralAppDatas.userId.value);

      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    emailController.text = "";
    passwordController.text = "";
    emailController.dispose();
    passwordController.dispose();

    Get.delete<LoginController>();
    super.dispose();
  }
}
