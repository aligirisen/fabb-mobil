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
    //incidents = generateItems(20);
  }
/*
  Location location = Location(latitude: 10.0, longitude: -125.0);
  //location

  List<Employee> generateItems(int numberOfItems) {
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
          description: 'description');
    });
  }*/
}
