import 'package:fabb_mobil/app/services/incident_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';
import 'package:universal_html/js_util.dart';

import '../../models/incident_model.dart';

class ListViewController extends GetxController {
  late List<IncidentModel> incidents;
  late TextEditingController locationController;
  RxBool isExpanded = false.obs;
  RxInt likeCount = 17.obs;
  RxInt dislikeCount = 5.obs;

  @override
  void onInit() {
    super.onInit();
    locationController = TextEditingController();
    incidents = generateItems(20);
  }

  //Location location = getLocation();

  List<IncidentModel> generateItems(int numberOfItems) {
    List<IncidentModel> incidents;
    //incidents = IncidentService().getIncidents();
    /*for (int i = 0; i < numberOfItems; i++) {
      IncidentService().getIncidents();
    }*/
    return List.generate(numberOfItems, (int index) {
      return IncidentModel(
          userId: 'userId',
          title: 'title',
          incidentId: 'Incident - $index Details',
          incidentStatus: 'incidentStatus',
          category: 'category',
          location: null,
          //attachments: ["attachments"],
          description: 'description',
          address: 'addressss',
          createDate: DateTime.now().toString());
    });
  }
}
/*
Note: C:\Users\agiri\AppData\Local\Pub\Cache\hosted\pub.dev\geolocator_android-4.1.7\android\src\main\java\com\baseflow\geolocator\location\FusedLocationClient.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
*/