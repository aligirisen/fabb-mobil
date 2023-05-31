import 'package:fabb_mobil/app/controllers/home/list_view_controller.dart';
import 'package:fabb_mobil/app/controllers/my_reports/my_reports_controller.dart';
import 'package:get/get.dart';
import '../controllers/auth pages/login_controller.dart';
import '../controllers/auth pages/signup_controller.dart';
import '../controllers/home/map_view_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(),
    );

    Get.put<SignupController>(
      SignupController(),
    );
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<MapViewController>(
      MapViewController(),
    );
    Get.put<ListViewController>(ListViewController());
  }
}

class MyReportsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<MyReportsController>(
      MyReportsController(),
    );
  }
}
