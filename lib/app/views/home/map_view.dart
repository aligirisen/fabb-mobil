import 'dart:async';

import 'package:fabb_mobil/app/controllers/home/map_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../general_app_datas/general_app_datas.dart';
import '../../theme/app_colors.dart';

class MapView extends StatelessWidget {
  MapView({super.key});
  final MapViewController controller = Get.put(MapViewController());
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> completer = Completer();
    return Scaffold(
      body: Obx(
        () => controller.isLoadingMarkers.isTrue
            ? Center(
                child: CircularProgressIndicator(
                color: AppColors.darkBlue,
              ))
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                        GeneralAppDatas.currentPosition.value!.latitude,
                        GeneralAppDatas.currentPosition.value!.longitude),
                    zoom: 17.0),
                mapType: controller.maptype.value,
                markers: Set<Marker>.of(controller.markers),
                myLocationEnabled: true,
                compassEnabled: true,
                onTap: (position) {
                  // controller.addMarker(position);
                },
                onMapCreated: (GoogleMapController mapController) {
                  completer.complete(mapController);
                },
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Column(
        children: [
          Padding(
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
        ],
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
