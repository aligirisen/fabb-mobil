import 'dart:async';

import 'package:fabb_mobil/app/controllers/home/map_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class MapView extends GetView<MapViewController> {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MapViewController>(
      () => MapViewController(),
    );
    final Completer<GoogleMapController> completer = Completer();
    return Scaffold(
      body: Obx(
        () => GoogleMap(
          initialCameraPosition: controller.initialPosition,
          mapType: controller.maptype.value,
          onMapCreated: (GoogleMapController mapController) {
            completer.complete(mapController);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: Obx(
          () => FloatingActionButton(
            backgroundColor: controller.backgroundColor.value,
            foregroundColor: controller.foregroundColor.value,
            child: Icon(
              Icons.map,
              color: controller.foregroundColor.value,
            ),
            onPressed: () {
              controller.changeMapType();
            },
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     goToLake();
      //   },
      //   label: const Text("To the lake!"),
      //   //icon: const Icon(Icons.directions_boat),
      // ),
    );
  }
}
