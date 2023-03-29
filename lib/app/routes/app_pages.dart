import 'dart:collection';

import 'package:get/get.dart';
import '../bindings/all_bindings.dart';
import '../modules/1-auth pages/views/login_view.dart';
import '../modules/1-auth pages/views/signup_view.dart';
import '../modules/0-onboarding/views/onboarding_view.dart';
import '../modules/2-home/views/home_view.dart';
import '../modules/2-home/views/map_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const initial = Routes.onboarding;

  static const login = Routes.login;
  static const signup = Routes.signup;
  static const home = Routes.home;
  static const map = Routes.map;

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
      name: _Paths.myreports,
      page: () => const HomeView(),
      binding: HomeBindings(), //change!!!!
    ),
    GetPage(
      name: _Paths.settings,
      page: () => const HomeView(),
      binding: HomeBindings(), //change!!!!
    ),
    GetPage(
      name: _Paths.contact,
      page: () => const HomeView(),
      binding: HomeBindings(), //change!!!!
    ),
    GetPage(
      name: _Paths.map,
      page: () => const SimpleMapScreen(),
      binding: HomeBindings(), //change!!!!
    ),
  ];
}
