import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/incident_model.dart';

class IncidentCategoryController extends GetxController {
  late List<IncidentModel> incidents;
  late TextEditingController locationTEController;

  @override
  void onInit() {
    super.onInit();
    locationTEController = TextEditingController();
  }

  //bana list of incident type lazım
  //tamam
}
