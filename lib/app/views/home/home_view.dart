import 'package:fabb_mobil/app/views/home/map_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common/navigation_drawer.dart';
import '../../controllers/home/map_screen_controller.dart';
import '../../theme/app_colors.dart';

class HomeView extends GetView<MapScreenController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: const CustomNavigationDrawer(),
          appBar: AppBar(
            toolbarHeight: 9.h,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(0),
              ),
            ),
            backgroundColor: AppColors.darkBlue,
            title: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(children: [
                Container(
                  height: 4.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: AppColors.lightBackgroundColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: TabBar(
                      indicator: BoxDecoration(
                          color: AppColors.lightBackgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      labelColor: AppColors.darkBlue,
                      unselectedLabelColor: AppColors.lightWords,
                      tabs: const [
                        Tab(
                          text: 'Map',
                        ),
                        Tab(
                          text: 'List',
                        )
                      ]),
                )
              ]),
            ),
          ),
          body: Stack(
            children: [
              const TabBarView(
                children: [SimpleMapScreen(), Center(child: Text("list"))],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    heroTag: "add",
                    onPressed: () {},
                    backgroundColor: AppColors.darkBlue,
                    child: const Icon(
                      Icons.add_rounded,
                      size: 30,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
