part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const newspage = _Paths.newspage;
  static const citydistrict = _Paths.citydistrict;
  static const firstinfo = _Paths.firstinfo;
  static const secondinfo = _Paths.secondinfo;
  static const thirdtinfo = _Paths.thirdinfo;
}

abstract class _Paths {
  static const home = '/home';
  static const newspage = '/newspage';
  static const citydistrict = '/citydistrict';
  static const firstinfo = '/firstinfo';
  static const secondinfo = '/secondinfo';
  static const thirdinfo = '/thirdinfo';
}
