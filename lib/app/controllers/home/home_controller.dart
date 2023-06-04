// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:get/get.dart';

// import 'list_view_controller.dart';
// import 'map_view_controller.dart';

// class HomeViewController extends GetxController
//     with TabChangeMixin
//     implements TickerProvider {
//   late TabController tabController;
 

//   @override
//   void onInit() {
//     tabController = TabController(length: 2, vsync: this);
//     tabController.addListener(() {
//       handleTabChange(tabController.index);
//     });
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     tabController.dispose();
//     super.onClose();
//   }

//   @override
//   Ticker createTicker(TickerCallback onTick) {
//     return Ticker(onTick);
//   }
// }

// mixin TabChangeMixin on GetxController {
//   void handleTabChange(int tabIndex) {
//     if (tabIndex == 0) {
//       isLoading(true);
//       print("map");
//       MapViewController().getCurrentLocation();
//       //getIncidentMarkers();
//       MapViewController().generateItems();
//     } else {}
//   }
// }



// import 'package:fabb_mobil/app/routes/app_pages.dart';
// import 'package:fabb_mobil/app/views/home/map_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:get/get.dart';

// import 'list_view_controller.dart';
// import 'map_view_controller.dart';

// mixin TabChangeMixin on GetxController {
//   void handleTabChange(int tabIndex) {
//     if (tabIndex == 0) {
//       MapViewController.to.initialize();
//       Get.toNamed(AppPages.map);
//     } else if (tabIndex == 1) {
//       ListViewController.to.initialize();
//       Get.toNamed(AppPages.list);
//     }
//   }
// }

// class HomeViewController extends GetxController
//     with TabChangeMixin
//     implements TickerProvider {
//   late TabController tabController = TabController(length: 2, vsync: this);

//   @override
//   void onInit() {
//     tabController.addListener(() {
//       handleTabChange(tabController.index);
//     });
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     tabController.dispose();
//     super.onClose();
//   }

//   @override
//   Ticker createTicker(TickerCallback onTick) {
//     return Ticker(onTick);
//   }
// }
