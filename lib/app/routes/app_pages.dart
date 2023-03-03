import 'package:get/get.dart';
import '../modules/auth_pages/bindings/auth_binding.dart';
import '../modules/auth_pages/view/login_view.dart';
import '../modules/auth_pages/view/signup_view.dart';
import '../modules/info pages/view/first_informing_page_view.dart';
import '../modules/info pages/view/second_informing_page_view.dart';
import '../modules/info pages/view/third_informing_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const initial = Routes.firstinfo;

  static const login = Routes.login;
  static const signup = Routes.signup;

  static final routes = [
    GetPage(
      name: _Paths.firstinfo,
      page: () => const FirstInformingPageView(),
    ),
    GetPage(
      name: _Paths.secondinfo,
      page: () => const SecondInformingPageView(),
    ),
    GetPage(
      name: _Paths.thirdinfo,
      page: () => const ThirdInformingPageView(),
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
