import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';
import 'package:fabb_mobil/app/services/incident_service.dart';
import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../models/incident_model.dart';
import '../../theme/app_strings.dart';

class ListViewController extends GetxController {
  late List<IncidentModel> incidents;
  late TextEditingController locationController;
  RxBool isExpanded = false.obs;

  RxInt likeCount = 17.obs;
  RxInt dislikeCount = 5.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    locationController = TextEditingController();
    generateItems();
  }

  void generateItems() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 3));

    List<IncidentModel> incidents;

    incidents = await IncidentService().getIncidents();

    for (var element in incidents) {
      IncidentModel(
          userId: element.userId,
          title: element.title,
          incidentId: element.incidentId,
          incidentStatus: element.incidentId,
          category: element.category,
          location: element.location,
          attachments: element.attachments,
          description: element.description,
          address: element.address,
          createDate: element.createDate.toString());
      GeneralAppDatas.incidentListList.add(element);
      GeneralAppDatas.incidentListMap.add(element);
    }
    isLoading.value = false;
  }

  AssetImage getIncidentIcon(String category) {
    switch (category) {
      case AppStrings.incident3title:
        return AppImages.roadDamage;
      case AppStrings.incident6title:
        return AppImages.green;
      case AppStrings.incident7title:
        return AppImages.transport;
      case AppStrings.incident2title:
        return AppImages.trafficSigns;
      case AppStrings.incident4title:
        return AppImages.waterDamage;
      case AppStrings.incident5title:
        return AppImages.animals;
      case AppStrings.incident8title:
        return AppImages.noise;
      case AppStrings.incident9title:
        return AppImages.sewage;
      case AppStrings.incident10title:
        return AppImages.health;
      case AppStrings.incident11title:
        return AppImages.social;
      case AppStrings.incident1title:
        return AppImages.roadSafety;
      default:
        return AppImages.imageNotFound;
    }
  }

  Color getColor(String category) {
    switch (category) {
      case AppStrings.incident3title:
        return AppColors.incident3RoadDamageColor;
      case AppStrings.incident6title:
        return AppColors.incident6Color;
      case AppStrings.incident7title:
        return AppColors.incident7Color;
      case AppStrings.incident2title:
        return AppColors.incident2TrafficSignsColor;
      case AppStrings.incident4title:
        return AppColors.incident4WaterDamageColor;
      case AppStrings.incident5title:
        return AppColors.incident5AnimalsColor;
      case AppStrings.incident8title:
        return AppColors.incident8Color;
      case AppStrings.incident9title:
        return AppColors.incident9Color;
      case AppStrings.incident10title:
        return AppColors.incident10Color;
      case AppStrings.incident11title:
        return AppColors.incident11Color;
      case AppStrings.incident1title:
        return AppColors.incident1RoadSafetyColor;
      default:
        return AppColors.greyTextColor;
    }
  }

  Color getSatusColor(String status) {
    switch (status) {
      case "In Progress":
        {
          return AppColors.statusInProgress;
        }

      case "Opened":
        {
          return AppColors.statusOpened;
        }
      case "Solved":
        {
          return AppColors.statusSolved;
        }
      case "Rejected":
        {
          return AppColors.statusRejected;
        }

      default:
        {
          return AppColors.greyTextColor;
        }
    }
  } //dispose'u sildim myreportsta da yoktu diye.
}
