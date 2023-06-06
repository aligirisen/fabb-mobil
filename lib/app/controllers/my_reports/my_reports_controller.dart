import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../general_app_datas/general_app_datas.dart';
import '../../models/incident_model.dart';
import '../../services/incident_service.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_images.dart';
import '../../theme/app_strings.dart';

class MyReportsController extends GetxController {
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getMyIncidents();
  }

  static MyReportsController get to => Get.find<MyReportsController>();

  void initialize() {
    Get.delete<MyReportsController>();
    Get.put(MyReportsController());
  }

  void getMyIncidents() async {
    GeneralAppDatas.inProgressMyReport = RxInt(0);
    GeneralAppDatas.solvedMyReport = RxInt(0);
    GeneralAppDatas.rejectedMyReport = RxInt(0);
    GeneralAppDatas.openedMyReport = RxInt(0);
    isLoading.value = true;
    GeneralAppDatas.myIncidentList.value = [];

    await Future.delayed(const Duration(milliseconds: 3));

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
      if (element.userId == GeneralAppDatas.userId.value) {
        GeneralAppDatas.myIncidentList.add(element);
        if (element.incidentStatus == "Opened") {
          GeneralAppDatas.openedMyReport = GeneralAppDatas.openedMyReport + 1;
        } else if (element.incidentStatus == "Rejected") {
          GeneralAppDatas.rejectedMyReport =
              GeneralAppDatas.rejectedMyReport + 1;
        } else if (element.incidentStatus == "In Progress") {
          GeneralAppDatas.inProgressMyReport =
              GeneralAppDatas.inProgressMyReport + 1;
        } else if (element.incidentStatus == "Solved") {
          GeneralAppDatas.solvedMyReport = GeneralAppDatas.solvedMyReport + 1;
        }
      }
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
  }

  Future<bool> deleteIncident(String incidentId) async {
    bool isDeleted = await IncidentService().deleteIncident(incidentId);

    if (isDeleted) {
      return true;
    } else {
      return false;
    }
  }
}
