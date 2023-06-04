import 'package:fabb_mobil/app/controllers/home/list_view_controller.dart';
import 'package:fabb_mobil/app/controllers/my_reports/my_reports_controller.dart';
import 'package:get/get.dart';
import '../controllers/auth pages/login_controller.dart';
import '../controllers/auth pages/signup_controller.dart';
import '../controllers/home/incident_category_controller.dart';
import '../controllers/home/incident_details_controller.dart';
import '../controllers/home/map_view_controller.dart';
import '../controllers/onboarding/onboarding_controller.dart';

class AllControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), tag: "login", fenix: true);
    Get.lazyPut(() => SignupController(), tag: "signup", fenix: true);
    Get.lazyPut(() => MapViewController(), tag: "map", fenix: true);
    Get.lazyPut(() => ListViewController(), tag: "list", fenix: true);
    Get.lazyPut(() => IncidentCategoryController(),
        tag: "category", fenix: true);
    Get.lazyPut(() => IncidentDetailsController(), tag: "details", fenix: true);
    Get.lazyPut(() => MyReportsController(), tag: "myReports", fenix: true);
    Get.lazyPut(() => OnboardingController(), tag: "list", fenix: true);
  }
}

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), tag: "login1", fenix: true);
    Get.lazyPut(() => SignupController(), tag: "login1", fenix: true);
  }
}

// class HomeBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.put<MapViewController>(
//       MapViewController(),
//     );
//     Get.put<ListViewController>(ListViewController());
//   }
// }

// class MyReportsBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.put<MyReportsController>(
//       MyReportsController(),
//     );
//   }
// }
