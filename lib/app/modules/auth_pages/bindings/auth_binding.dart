import 'package:fabb_mobil/app/modules/auth_pages/controller/signup_controller.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
