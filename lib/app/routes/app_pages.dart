import 'package:fabb_mobil/app/controllers/home/list_view_controller.dart';
import 'package:fabb_mobil/app/views/contact/contact_view.dart';
import 'package:fabb_mobil/app/views/home/incident_details_view.dart';
import 'package:fabb_mobil/app/views/my%20reports/my_reports_view.dart';
import 'package:get/get.dart';
import '../bindings/all_bindings.dart';
import '../controllers/auth pages/login_controller.dart';
import '../controllers/auth pages/signup_controller.dart';
import '../controllers/home/home_controller.dart';
import '../controllers/home/incident_details_controller.dart';
import '../controllers/home/map_view_controller.dart';
import '../controllers/my_reports/my_reports_controller.dart';
import '../views/auth pages/login_view.dart';
import '../views/auth pages/signup_view.dart';
import '../views/auth pages/terms_n_conditions.dart';
import '../views/home/incident_category_view.dart';
import '../views/home/guest/guest_new_incident_view.dart';
import '../views/home/home_view.dart';
import '../views/home/list_view.dart';
import '../views/home/map_view.dart';
import '../views/home/successfully_reported_view.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/settings/settings_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.onboarding;

  static const login = Routes.login;
  static const signup = Routes.signup;
  static const home = Routes.home;
  static const map = Routes.map;
  static const list = Routes.list;

  static const accidentType = Routes.incidentcategory;

  static final routes = [
    GetPage(
      name: _Paths.onboarding,
      page: () => OnboardingPageView(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.putAsync(() async => LoginController());
      }),
    ),
    GetPage(
      name: _Paths.signup,
      page: () => SignupView(),
      binding: BindingsBuilder(() {
        Get.putAsync(() async => SignupController());
      }),
    ),
    GetPage(
        name: _Paths.home,
        page: () => HomeView(),
        binding: AllControllerBinding()),
    GetPage(
      name: _Paths.map,
      page: () => MapView(),
      binding: BindingsBuilder(() {
        Get.putAsync(() async => MapViewController());
      }),
    ),
    GetPage(
      name: _Paths.list,
      page: () => MapListView(),
      binding: BindingsBuilder(() {
        Get.putAsync(() async => ListViewController());
      }),
    ),
    GetPage(
      name: _Paths.myreports,
      page: () => MyReportsView(),
      // binding: BindingsBuilder(() {
      //   Get.putAsync<MyReportsController>(() async => MyReportsController());
      // }),
    ),
    GetPage(
      name: _Paths.settings,
      page: () => const SettingsView(),
    ),
    GetPage(
      name: _Paths.contact,
      page: () => const ContactView(),
    ),
    GetPage(
      name: _Paths.incidentcategory,
      page: () => const IncidentCategoryView(),
    ),
    GetPage(
      name: _Paths.incidentDetails,
      page: () => IncidentDetailsView(),
      binding: BindingsBuilder(() {
        Get.putAsync(() async => IncidentDetailsController());
      }),
    ),
    GetPage(
      name: _Paths.succcesfulyReportedPage,
      page: () => const SuccessfullyReportedView(),
    ),
    GetPage(
      name: _Paths.guestNewIncident,
      page: () => const GuestNewIncidentView(),
    ),
    GetPage(
      name: _Paths.termsncontitions,
      page: () => TermsnConditionsView(),
    ),
  ];
}
