import 'package:get/get.dart';
import '../controllers/auth pages/login_controller.dart';
import '../controllers/auth pages/signup_controller.dart';
import '../controllers/home/map_view_controller.dart';

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
    Get.lazyPut<MapViewController>(
      () => MapViewController(),
    );
  }
}
