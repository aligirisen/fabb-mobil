import 'package:fabb_mobil/app/modules/news_page/view/a_new_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import "package:shimmer/shimmer.dart";
import '../../../theme/app_colors.dart';
import '../controller/news_page_controller.dart';

class NewsPageView extends StatelessWidget {
  final NewsPageController newsPageController = Get.put(NewsPageController());

  final DateTime now = DateTime.now();

  NewsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEE, MMM d, ' 'yy').format(now);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: Text(formattedDate),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.sunny,
            ),
            onPressed: () {
              context.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
            },
          )
        ],
      ),
      body: Container(
        color: AppColors.lightBackgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: const [
                  Text(
                    'LATEST NEWS',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                  /*
                  IconButton(
                      icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                  IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),*/
                ],
              ),
            ),
            Obx(() {
              return newsPageController.newsLoading.value
                  ? Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => loaderForNews(),
                          separatorBuilder: (contex, index) => const SizedBox(
                                height: 16,
                              ),
                          itemCount: 3),
                    )
                  : Expanded(
                      child: StaggeredGridView.countBuilder(
                        physics: const ClampingScrollPhysics(),
                        crossAxisCount: 1,
                        itemCount: newsPageController.newsList.length,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          return aNew(newsPageController.newsList[index]);
                        },
                        staggeredTileBuilder: (index) =>
                            const StaggeredTile.fit(1),
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }

  Widget shimmerCardforNews({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
    );
  }

  Widget loaderForNews() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shimmerCardforNews(
                  height: 200,
                  width: Get.width,
                ),
                const SizedBox(height: 8),
                shimmerCardforNews(
                  height: 15,
                  width: 150,
                ),
                const SizedBox(height: 15),
                shimmerCardforNews(
                  height: 15,
                  width: 120,
                ),
                const SizedBox(height: 8),
                shimmerCardforNews(
                  height: 60,
                  width: 380,
                ),
              ],
            ),
          ),
        ));
  }
}
