import "package:get/get.dart";
import '../controller/city_district_page_controller.dart';

class CityDistrictPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CityDistrictPageController());
  }
}
