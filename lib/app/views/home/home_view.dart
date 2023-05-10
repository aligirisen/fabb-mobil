import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';
import 'package:fabb_mobil/app/views/home/incident_type_view.dart';
import 'package:fabb_mobil/app/views/home/list_view.dart';
import 'package:fabb_mobil/app/views/home/map_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common/navigation_drawer.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class HomeView extends StatelessWidget {
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
              TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [MapView(), MapListView()],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    heroTag: "new_incident",
                    onPressed: () {
                      GeneralAppDatas.isLoggedIn.value == true
                          ? Get.toNamed(Routes.incidentType)
                          : Get.toNamed(Routes.guestNewIncident);
                    },
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
