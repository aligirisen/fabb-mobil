import 'package:get/get.dart';
import '../modules/auth_pages/bindings/auth_binding.dart';
import '../modules/auth_pages/view/login_view.dart';
import '../modules/auth_pages/view/signup_view.dart';
import '../modules/info pages/view/onboarding_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const initial = Routes.onboarding;

  static const login = Routes.login;
  static const signup = Routes.signup;

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
  ];
}
