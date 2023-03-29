import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenController extends GetxController {
  late final GoogleMapController mapController;
  Completer<GoogleMapController> completer = Completer();

  final CameraPosition startPosition = CameraPosition(
    target: LatLng(39.903358459472656, 32.79481887817383),
    zoom: 16,
  );

  bool isMissionPressed = false;
  final autoSizeGroup = AutoSizeGroup();

  bool trapStatus = false;

  @override
  void onInit() {
    _createMapController();
    super.onInit();
  }

  void _createMapController() async {
    mapController = await completer.future;
  }
}
