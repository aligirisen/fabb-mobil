import 'package:get/get.dart';
import '../modules/info pages/second_informing_page/view/second_informing_page_view.dart';
import '../modules/info pages/third_informing_page/view/third_informing_page_view.dart';
import '../modules/info pages/first_informing_page/view/first_informing_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.firstinfo;

  static final routes = [
    GetPage(
      name: _Paths.firstinfo,
      page: () => FirstInformingPageView(),
    ),
    GetPage(
      name: _Paths.secondinfo,
      page: () => SecondInformingPageView(),
    ),
    GetPage(
      name: _Paths.thirdinfo,
      page: () => ThirdInformingPageView(),
    ),
  ];
}
