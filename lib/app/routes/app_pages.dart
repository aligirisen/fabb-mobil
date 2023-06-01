import 'package:fabb_mobil/app/views/contact/contact_view.dart';
import 'package:fabb_mobil/app/views/home/incident_details_view.dart';
import 'package:fabb_mobil/app/views/my%20reports/my_reports_view.dart';
import 'package:get/get.dart';
import '../bindings/all_bindings.dart';
import '../views/auth pages/login_view.dart';
import '../views/auth pages/signup_view.dart';
import '../views/home/incident_category_view.dart';
import '../views/home/guest/guest_new_incident_view.dart';
import '../views/home/home_view.dart';
import '../views/home/map_view.dart';
import '../views/home/successfully_reported_view.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/settings/settings_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const initial = Routes.onboarding;

  static const login = Routes.login;
  static const signup = Routes.signup;
  static const home = Routes.home;
  static const map = Routes.map;

  static const accidentType = Routes.incidentType;

  static final routes = [
    GetPage(
      name: _Paths.onboarding,
      page: () => OnboardingPageView(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: _Paths.signup,
      page: () => const SignupView(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: _Paths.map,
      page: () => const MapView(),
      binding: HomeBindings(),
    ),
    GetPage(
        name: _Paths.myreports,
        page: () => const MyReportsView(),
        binding: MyReportsBindings()),
    GetPage(
      name: _Paths.settings,
      page: () => const SettingsView(),
    ),
    GetPage(
      name: _Paths.contact,
      page: () => const ContactView(),
    ),
    GetPage(
      name: _Paths.incidentType,
      page: () => const IncidentCategoryView(),
    ),
    GetPage(
      name: _Paths.incidentDetails,
      page: () => IncidentDetailsView(),
    ),
    GetPage(
      name: _Paths.succcesfulyReportedPage,
      page: () => const SuccessfullyReportedView(),
    ),
    GetPage(
      name: _Paths.guestNewIncident,
      page: () => const GuestNewIncidentView(),
    ),
  ];
}
