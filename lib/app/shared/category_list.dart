import '../models/incident_type_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_images.dart';
import '../theme/app_strings.dart';

class CategoryList {
  static List<IncidentTypeModel> incidentTypes = [
    IncidentTypeModel(AppImages.roadSafety, AppStrings.incident1title,
        AppStrings.incident1text, AppColors.incidentRoadSafety),
    IncidentTypeModel(AppImages.trafficSigns, AppStrings.incident2title,
        AppStrings.incident2text, AppColors.incidentTrafficSigns),
    IncidentTypeModel(AppImages.roadDamage, AppStrings.incident3title,
        AppStrings.incident3text, AppColors.incidentRoadDamage),
    IncidentTypeModel(AppImages.waterDamage, AppStrings.incident4title,
        AppStrings.incident4text, AppColors.incidentWaterDamage),
    IncidentTypeModel(AppImages.roadSafety, AppStrings.incident1title,
        AppStrings.incident1text, AppColors.incidentRoadSafety),
    IncidentTypeModel(AppImages.trafficSigns, AppStrings.incident2title,
        AppStrings.incident2text, AppColors.incidentTrafficSigns),
    IncidentTypeModel(AppImages.roadDamage, AppStrings.incident3title,
        AppStrings.incident3text, AppColors.incidentRoadDamage),
    IncidentTypeModel(AppImages.waterDamage, AppStrings.incident4title,
        AppStrings.incident4text, AppColors.incidentWaterDamage),
  ];
}
