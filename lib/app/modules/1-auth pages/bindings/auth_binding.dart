import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../controllers/signup_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(
      () => AuthService(),
    );
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
