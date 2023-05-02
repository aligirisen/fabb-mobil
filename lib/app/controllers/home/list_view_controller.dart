import 'dart:js_util';

import 'package:fabb_mobil/app/services/incident_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:universal_html/html.dart';

import '../../models/incident_model.dart';

class ListViewController extends GetxController {
  late List<Incident> incidents;
  late TextEditingController locationController;

  @override
  void onInit() {
    super.onInit();
    locationController = TextEditingController();
    incidents = generateItems(20);
  }

  Location location = getLocation();

  List<Incident> generateItems(int numberOfItems) {
    List<Incident> incidents;
    incidents = IncidentService().getIncidents();
    /*for (int i = 0; i < numberOfItems; i++) {
      IncidentService().getIncidents();
    }*/
    return List.generate(numberOfItems, (int index) {
      return Incident(
          name: 'Incident - $index',
          isExpanded: false.obs,
          userId: 'userId',
          title: 'title',
          incidentId: 'Incident - $index Details',
          incidentStatus: 'incidentStatus',
          category: 'category',
          location: location,
          attachments: ["attachments"],
          description: 'description',
          address: 'addressss',
          createDate: DateTime.now());
    });
  }

  static Location getLocation() {
    throw notEqual(2, 4);
  }
}
/*
Note: C:\Users\agiri\AppData\Local\Pub\Cache\hosted\pub.dev\geolocator_android-4.1.7\android\src\main\java\com\baseflow\geolocator\location\FusedLocationClient.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
*/