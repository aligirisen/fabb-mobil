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

  List<IncidentTypeModel> incidentTypes = [
    IncidentTypeModel(AppImages.roadSafety, AppStrings.incident1title,
        AppStrings.incident1text, AppColors.incident1color),
    IncidentTypeModel(AppImages.trafficSigns, AppStrings.incident2title,
        AppStrings.incident2text, AppColors.incident2color),
    IncidentTypeModel(AppImages.roadDamage, AppStrings.incident3title,
        AppStrings.incident3text, AppColors.incident3color),
    IncidentTypeModel(AppImages.waterDamage, AppStrings.incident4title,
        AppStrings.incident4text, AppColors.incident4color),
    IncidentTypeModel(AppImages.roadSafety, AppStrings.incident1title,
        AppStrings.incident1text, AppColors.incident1color),
    IncidentTypeModel(AppImages.trafficSigns, AppStrings.incident2title,
        AppStrings.incident2text, AppColors.incident2color),
    IncidentTypeModel(AppImages.roadDamage, AppStrings.incident3title,
        AppStrings.incident3text, AppColors.incident3color),
    IncidentTypeModel(AppImages.waterDamage, AppStrings.incident4title,
        AppStrings.incident4text, AppColors.incident4color),
  ];
}
