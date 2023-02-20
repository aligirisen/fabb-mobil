import 'package:get/get.dart';
import '../controller/news_page_controller.dart';

class NewsPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsPageController());
  }
}
