part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const firstinfo = _Paths.firstinfo;
  static const secondinfo = _Paths.secondinfo;
  static const thirdtinfo = _Paths.thirdinfo;

  static const login = _Paths.login;
  static const signup = _Paths.signup;
}

abstract class _Paths {
  static const firstinfo = '/firstinfo';
  static const secondinfo = '/secondinfo';
  static const thirdinfo = '/thirdinfo';

  static const login = '/login';
  static const signup = '/signup';
}
