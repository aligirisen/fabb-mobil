import 'package:get/state_manager.dart';

import '../model/news_model.dart';
import '../service/news_service.dart';

class NewsPageController extends GetxController {
  RxBool newsLoading = true.obs;
  RxList<NewsModel> newsList = <NewsModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      newsLoading(true);
      newsList.value = await NewsService.fetchProducts();
    } finally {
      newsLoading(false);
    }
  }
}
