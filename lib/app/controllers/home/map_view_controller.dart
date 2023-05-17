import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

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

  //  List<Marker> markers = <Marker>[
  //   Marker(
  //       markerId: MarkerId('1'),
  //       position: LatLng(37.43296265331129, -122.08832357078792),
  //       infoWindow: InfoWindow(
  //         title: 'My Position',
  //       )),
  // ];

  final Set<Marker> _markers = {};

  Set<Marker> get markers => _markers;

  void addMarker(LatLng position) async {
    final icon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/traffic_signs.png',
    );

    _markers.add(
      Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        icon: icon,
      ),
    );

    update();
  }

  void clearMarkers() {
    _markers.clear();
    update();
  }

//NOTLAR
  //get markers metodu yazılmalı
  //UPDATE markers

// declared method to get Images
  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  // @override
  // void dispose() {
  //   _disposeController();
  //   super.dispose();
  // }

  // Future<void> _disposeController() async {
  //   final GoogleMapController controller = await completer.future;
  //   controller.dispose();
  // }

  // Future<void> goToCurrentPosition() async {
  //   final GoogleMapController mapController = await completer.future;
  //   mapController.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  // }
}
