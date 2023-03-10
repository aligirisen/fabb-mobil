part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const onboarding = _Paths.onboarding;

  static const login = _Paths.login;
  static const signup = _Paths.signup;
}

abstract class _Paths {
  static const onboarding = '/onboarding';

  static const login = '/login';
  static const signup = '/signup';
}
