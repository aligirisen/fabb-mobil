import 'dart:ui' as ui;
import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../common/incidentCard.dart';
import '../../general_app_datas/general_app_datas.dart';
import '../../models/incident_model.dart';
import '../../services/incident_service.dart';

class MapViewController extends GetxController {
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

  RxBool isLoading = true.obs;

  static MapViewController get to => Get.find<MapViewController>();

  @override
  void onInit() {
    getCurrentLocation();
    //getIncidentMarkers();
    generateItems();
    _getMarkers();
    super.onInit();
  }

  void initialize() {
    getCurrentLocation();
    //getIncidentMarkers();
    generateItems();
    _getMarkers();
    Get.delete<MapViewController>();
    Get.put(MapViewController());
  }

  void generateItems() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 3));

    List<IncidentModel> incidents;

    incidents = await IncidentService().getIncidents();

    for (var element in incidents) {
      IncidentModel(
          userId: element.userId,
          title: element.title,
          incidentId: element.incidentId,
          incidentStatus: element.incidentId,
          category: element.category,
          location: element.location,
          attachments: element.attachments,
          description: element.description,
          address: element.address,
          createDate: element.createDate.toString());
      GeneralAppDatas.incidentListMap.add(element);
    }
    isLoading.value = false;
  }

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

  Future<void> _getMarkers() async {
    isLoadingMarkers.value = true;
    await Future.delayed(Duration(seconds: 4));

    BitmapDescriptor roadDamageIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/road_damage.png',
    );
    addMarkersFromCoordinates(GeneralAppDatas.incidentListMap);
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

  void addMarkersFromCoordinates(List<IncidentModel> incidentList) async {
    // LatLng targetLocation = LatLng(39.920275, 32.868510);
    // double maxDistance = 1000; // 2 kilometre

    for (int i = 0; i < incidentList.length; i++) {
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
        markerId: MarkerId(incidentList[i].incidentId ?? ""),
        position: LatLng(incidentList[i].location!.latitude!,
            incidentList[i].location!.longitude!),
        infoWindow: InfoWindow(
          title: incidentList[i].title,
        ),
        icon: await selectMarker(incidentList[i].category ?? ""),
        onTap: () {
          _showBottomSheet(incidentList[i]);
        },
      );
      print("xxx");
      print(GeneralAppDatas.incidentListMap[i].location!.longitude!);
      print(GeneralAppDatas.incidentListMap[i].location!.latitude!);
      markers.add(marker);
    }
  }

  void _showBottomSheet(IncidentModel incidentModel) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        backgroundColor: AppColors.listViewContainerColor,
        context: Get.context!,
        builder: (context) => IncidentCard(incidentModel));
  }

  Future<BitmapDescriptor> selectMarker(String category) async {
    BitmapDescriptor roadSafetyIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/road_safety.png',
    );

    BitmapDescriptor trafficSignIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/traffic_signs.png',
    );

    BitmapDescriptor roadDamageIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/road_damage.png',
    );
    BitmapDescriptor waterDamageIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/water_damage.png',
    );
    BitmapDescriptor animalsIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/icons/animals.png',
    );
    BitmapDescriptor parksIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/icons/green.png',
    );
    BitmapDescriptor transportIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/icons/transport.png',
    );
    BitmapDescriptor noiseIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/icons/noise.png',
    );
    BitmapDescriptor sewageIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/icons/sewage.png',
    );
    BitmapDescriptor healthIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/icons/health.png',
    );
    BitmapDescriptor socialIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/icons/social.png',
    );
    BitmapDescriptor imageNotFoundIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/icons/not_found.png',
    );

    switch (category) {
      case AppStrings.incident1title:
        return roadSafetyIcon;
      case AppStrings.incident2title:
        return trafficSignIcon;

      case AppStrings.incident3title:
        return roadDamageIcon;

      case AppStrings.incident4title:
        return waterDamageIcon;
      case AppStrings.incident5title:
        return animalsIcon;
      case AppStrings.incident6title:
        return parksIcon;
      case AppStrings.incident7title:
        return transportIcon;
      case AppStrings.incident8title:
        return noiseIcon;
      case AppStrings.incident9title:
        return sewageIcon;
      case AppStrings.incident10title:
        return healthIcon;
      case AppStrings.incident11title:
        return socialIcon;

      default:
        {
          return imageNotFoundIcon;
        }
    }
  }

  void clearMarkers() {
    markers.clear();
    update();
  }

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

  // @override
  // void dispose() {
  //   Get.delete<MapViewController>();
  //   super.dispose();
  // }

  // @override
  // void onClose() {
  //   Get.delete<MapViewController>();
  //   super.onClose();
  // }
}
