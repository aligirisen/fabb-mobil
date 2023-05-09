import 'package:fabb_mobil/app/services/incident_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';

import '../../models/incident_model.dart';

class ListViewController extends GetxController {
  late List<IncidentModel> incidents;
  late TextEditingController locationController;
  RxBool isExpanded = false.obs;
  RxList<IncidentModel> incidentList = <IncidentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    locationController = TextEditingController();
    generateItems(20);
  }

  void generateItems(int numberOfItems) async {
    List<IncidentModel> incidents;

    incidents = await IncidentService().getIncidents();

    print(incidents);

    for (var element in incidents) {
      var model = IncidentModel(
          userId: element.userId,
          title: element.title,
          incidentId: element.incidentId,
          incidentStatus: element.incidentId,
          category: element.category,
          location: null,
          //attachments: ["attachments"],
          description: element.description,
          address: element.address,
          createDate: element.createDate.toString());
      incidentList.add(element);
    }
    print(incidentList);
  }
}
