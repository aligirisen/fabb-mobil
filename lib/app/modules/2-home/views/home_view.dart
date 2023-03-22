import 'package:fabb_mobil/app/modules/2-home/views/map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/app_colors.dart';
import '../../common/navigation_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: CustomNavigationDrawer(),
          appBar: AppBar(
            toolbarHeight: 9.h,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(0),
              ),
            ),
            backgroundColor: AppColors.darkBlue,
            title: Padding(
              padding: EdgeInsets.all(8),
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
                      tabs: [
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
                children: [
                  Center(child: Text("map")),
                  Center(child: Text("list"))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
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
