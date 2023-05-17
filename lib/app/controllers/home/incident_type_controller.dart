import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:fabb_mobil/app/theme/app_strings.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/incident_model.dart';
import '../../models/incident_type_model.dart';

class IncidentTypeController extends GetxController {
  late List<IncidentModel> incidents;
  late TextEditingController locationController;

  @override
  void onInit() {
    super.onInit();
    locationController = TextEditingController();
  }

  //bana list of incident type lazım
  //tamam
}
