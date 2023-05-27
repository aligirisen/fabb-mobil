import 'dart:async';
import 'dart:ui' as ui;
import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../general_app_datas/general_app_datas.dart';

class MapViewController extends GetxController {
  @override
  void onInit() {
    _getMarkers();
    getCurrentLocation();
    //getIncidentMarkers();
    super.onInit();
  }

  GoogleMapController? mapController;
  Marker? currentLocationMarker;

  Set<Marker> markers = {};
  RxBool isLoadingMarkers = false.obs;

  CameraPosition initialPosition =
      CameraPosition(target: LatLng(39.925533, 32.866287), zoom: 14.0);

  CameraPosition targetPosition = CameraPosition(
      target: LatLng(39.925533, 32.866287),
      zoom: 14.0,
      bearing: 192.0,
      tilt: 60);

  Rx<MapType> maptype = MapType.normal.obs;
  var backgroundColor = AppColors.darkBlue.obs;
  var foregroundColor = Colors.white.obs;

  List<LatLng> coordinates = [
    LatLng(39.933543, 32.859678),
    LatLng(39.940123, 32.854321),
    LatLng(39.912345, 32.845678),
    LatLng(39.912345, 32.875432),
    LatLng(39.928765, 32.869012),
    LatLng(39.931234, 32.857901),
    LatLng(39.938765, 32.851234),
    LatLng(39.920987, 32.842765),
    LatLng(39.915432, 32.879876),
    LatLng(39.923456, 32.871234),
    LatLng(39.932187, 32.862345),
    LatLng(39.944321, 32.849876),
    LatLng(39.916543, 32.837654),
    LatLng(39.918765, 32.889012),

    LatLng(39.920275, 32.868510), // Kurtuluş Parkı
    LatLng(39.917977, 32.868689),
    LatLng(39.918765, 32.867432),
    LatLng(39.919543, 32.867987),
    LatLng(39.920321, 32.869123),

    LatLng(39.973475, 32.718256),
    LatLng(39.974381, 32.720987),
    LatLng(39.976543, 32.715432),

    LatLng(37.291116, -121.839467),
    LatLng(37.290678, -121.842229),
    LatLng(37.292101, -121.839132),
    LatLng(37.292540, -121.841893),
    LatLng(37.291984, -121.842941),
  ];
  //current location işlemleri

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Konum izni reddedildiğinde yapılacak işlemleri burada gerçekleştirebilirsiniz
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      GeneralAppDatas.currentPosition.value = position;
      updateCurrentLocationMarker();
    } catch (e) {
      // Hata durumunda yapılacak işlemleri burada gerçekleştirebilirsiniz
    }
  }

  void updateCurrentLocationMarker() {
    if (mapController != null) {
      LatLng currentPositionLatLng = LatLng(
        GeneralAppDatas.currentPosition.value!.latitude,
        GeneralAppDatas.currentPosition.value!.longitude,
      );

      if (markers.isEmpty) {
        markers.add(
          Marker(
            markerId: MarkerId('current_location_marker'),
            position: currentPositionLatLng,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
          ),
        );
      } else {
        markers = markers.toSet()
          ..removeWhere(
              (marker) => marker.markerId.value == 'current_location_marker');

        markers.add(
          Marker(
            markerId: MarkerId('current_location_marker'),
            position: currentPositionLatLng,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
          ),
        );
      }

      mapController!
          .animateCamera(CameraUpdate.newLatLng(currentPositionLatLng));
      update();
    }
  }

//map related işlemler
  void changeMapType() {
    if (maptype.value == MapType.satellite) {
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

  Future<void> _getMarkers() async {
    isLoadingMarkers.value = true;
    await Future.delayed(Duration(seconds: 4));

    BitmapDescriptor trafficSignIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/traffic_signs.png',
    );

    BitmapDescriptor roadDamageIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/road_damage.png',
    );
    addMarkersFromCoordinates(coordinates);
    isLoadingMarkers.value = false;
    // Marker marker = Marker(
    //     markerId: MarkerId('1'),
    //     position: LatLng(39.925533, 32.866287),
    //     infoWindow: InfoWindow(
    //       title: 'Traffic Signs Problem',
    //     ),
    //     icon: trafficSignIcon);

    // _markers.add(marker);
  }

  void addMarkersFromCoordinates(List<LatLng> coordinates) async {
    LatLng targetLocation = LatLng(39.920275, 32.868510);
    double maxDistance = 1000; // 2 kilometre

    for (int i = 0; i < coordinates.length; i++) {
      // double distance = Geolocator.distanceBetween(
      //   targetLocation.latitude,
      //   targetLocation.longitude,
      //   coordinates[i].latitude,
      //   coordinates[i].longitude,
      // );
      // print(distance);
      // if (distance <= maxDistance) {
      //   Marker marker = Marker(
      //     markerId: MarkerId('marker_$i'),
      //     position: coordinates[i],
      //     infoWindow: InfoWindow(
      //       title: 'Marker $i',
      //     ),
      //     // İsteğe bağlı: Icon, renk, açıklama, vs. ekleyebilirsiniz.
      //   );
      //   markers.add(marker);
      // }

      Marker marker = Marker(
        markerId: MarkerId('marker_$i'),
        position: coordinates[i],
        infoWindow: InfoWindow(
          title: 'Marker $i',
        ),
        // icon: await BitmapDescriptor.fromAssetImage(
        //   ImageConfiguration(
        //     size: Size(5.w, 3.h),
        //     devicePixelRatio: 5,
        //   ),
        //   'assets/images/road_damage.png',
        // )
        // İsteğe bağlı: Icon, renk, açıklama, vs. ekleyebilirsiniz.
      );
      markers.add(marker);
    }
  }

  void clearMarkers() {
    markers.clear();
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

  @override
  void dispose() {
    Get.delete<MapViewController>();
    super.dispose();
  }
}
