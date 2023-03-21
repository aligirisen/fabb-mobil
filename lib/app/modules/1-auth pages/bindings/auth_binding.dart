import 'package:fabb_mobil/app/modules/1-auth%20pages/controllers/login_controller.dart';
import 'package:fabb_mobil/app/modules/2-home/controllers/map_screen_controller.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../controllers/signup_controller.dart';

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

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapScreenController>(
      () => MapScreenController(),
    );
  }
}
