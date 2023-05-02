import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/incident_model.dart';

class IncidentTypeController extends GetxController {
  late List<IncidentModel> incidents;
  late TextEditingController locationController;
  var selectedType = null;

  @override
  void onInit() {
    super.onInit();
    locationController = TextEditingController();
  }

  //bana list of incident type lazım
  //tamam
}
