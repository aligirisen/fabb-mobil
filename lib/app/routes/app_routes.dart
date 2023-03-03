part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const firstinfo = _Paths.firstinfo;
  static const secondinfo = _Paths.secondinfo;
  static const thirdtinfo = _Paths.thirdinfo;
}

abstract class _Paths {
  static const firstinfo = '/firstinfo';
  static const secondinfo = '/secondinfo';
  static const thirdinfo = '/thirdinfo';
}
