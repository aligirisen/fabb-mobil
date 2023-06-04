import 'package:fabb_mobil/app/controllers/my_reports/my_reports_controller.dart';
import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';
import 'package:fabb_mobil/app/views/home/incident_category_view.dart';
import 'package:fabb_mobil/app/views/home/list_view.dart';
import 'package:fabb_mobil/app/views/home/map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import '../../common/navigation_drawer.dart';
import '../../controllers/home/home_controller.dart';
import '../../controllers/home/list_view_controller.dart';
import '../../controllers/home/map_view_controller.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final MapViewController mapController = Get.put(MapViewController());
  final ListViewController listController = Get.put(ListViewController());

  // final HomeViewController homeViewController = Get.put(HomeViewController());

  Future<bool> _onWillPop() async {
    if (GeneralAppDatas.isLoggedIn.value == true) {
      return await showDialog(
        context: Get.overlayContext!,
        builder: (context) => AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform log out actions here
                Navigator.of(context).pop(true);
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      );
    } else {
      Get.offNamed(Routes.login);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: CustomNavigationDrawer(),
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
                        border:
                            Border.all(color: AppColors.lightBackgroundColor),
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
                      ],
                    ),
                  )
                ]),
              ),
            ),
            body: Stack(
              children: [
                TabBarView(
                  // controller: homeViewController.tabController,
                  physics: const NeverScrollableScrollPhysics(),

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
                            ? Get.toNamed(Routes.incidentcategory)
                            : Get.toNamed(Routes.guestNewIncident);
                        print(
                            "loggedin user id nedir? ${GeneralAppDatas.userId.value}");
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
      ),
    );
  }
}
