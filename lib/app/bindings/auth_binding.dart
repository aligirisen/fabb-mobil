import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import '../services/auth_service.dart';

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
