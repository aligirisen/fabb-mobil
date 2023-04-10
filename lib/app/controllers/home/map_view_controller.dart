import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final Completer<GoogleMapController> completer = Completer();

  CameraPosition initialPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.0);

  CameraPosition targetPosition = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 14.0,
      bearing: 192.0,
      tilt: 60);

  Rx<MapType> maptype = MapType.normal.obs;
  var backgroundColor = AppColors.darkBlue.obs;
  var foregroundColor = Colors.white.obs;

  void changeMapType() {
    if (maptype == MapType.satellite) {
      maptype.value = MapType.normal;
      backgroundColor.value = AppColors.darkBlue;
      foregroundColor.value = Colors.white;
    } else {
      maptype.value = MapType.satellite;
      backgroundColor.value = Colors.white;
      foregroundColor.value = AppColors.darkBlue;
    }
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  Future<void> _disposeController() async {
    final GoogleMapController controller = await completer.future;
    controller.dispose();
  }

  // Future<void> goToCurrentPosition() async {
  //   final GoogleMapController mapController = await completer.future;
  //   mapController.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  // }
}
