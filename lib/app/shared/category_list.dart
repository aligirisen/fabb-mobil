import '../models/incident_type_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_images.dart';
import '../theme/app_strings.dart';

class CategoryList {
  static List<IncidentTypeModel> incidentTypes = [
    IncidentTypeModel(AppImages.green, AppStrings.incident6title,
        AppStrings.incident6text, AppColors.incident6Color),
    IncidentTypeModel(AppImages.transport, AppStrings.incident7title,
        AppStrings.incident7text, AppColors.incident7Color),

    IncidentTypeModel(AppImages.trafficSigns, AppStrings.incident2title,
        AppStrings.incident2text, AppColors.incident2TrafficSignsColor),
    IncidentTypeModel(AppImages.roadDamage, AppStrings.incident3title,
        AppStrings.incident3text, AppColors.incident3RoadDamageColor),
    IncidentTypeModel(AppImages.waterDamage, AppStrings.incident4title,
        AppStrings.incident4text, AppColors.incident4WaterDamageColor),

    //5
    IncidentTypeModel(AppImages.animals, AppStrings.incident5title,
        AppStrings.incident5text, AppColors.incident5AnimalsColor),
    IncidentTypeModel(AppImages.noise, AppStrings.incident8title,
        AppStrings.incident8text, AppColors.incident8Color),
    IncidentTypeModel(AppImages.sewage, AppStrings.incident9title,
        AppStrings.incident9text, AppColors.incident9Color),
    IncidentTypeModel(AppImages.health, AppStrings.incident10title,
        AppStrings.incident10text, AppColors.incident10Color),
    IncidentTypeModel(AppImages.social, AppStrings.incident10title,
        AppStrings.incident11text, AppColors.incident11Color),
    IncidentTypeModel(AppImages.roadSafety, AppStrings.incident1title,
        AppStrings.incident1text, AppColors.incident1RoadSafetyColor),
  ];
}
