import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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

  List<Incident> generateItems(int numberOfItems) {
    return List.generate(numberOfItems, (int index) {
      return Incident(
          name: 'Incident - $index',
          isExpanded: false.obs,
          userId: 'userId',
          title: 'title',
          incidentId: 'Incident - $index Details',
          incidentStatus: 'incidentStatus',
          category: 'category',
          location: null,
          attachments: ["attachments"],
          description: 'description');
    });
  }
}
