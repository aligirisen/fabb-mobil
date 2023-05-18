import 'package:fabb_mobil/app/services/incident_service.dart';
import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';

import '../../models/incident_model.dart';

class ListViewController extends GetxController {
  late List<IncidentModel> incidents;
  late TextEditingController locationController;
  RxBool isExpanded = false.obs;
  RxList<IncidentModel> incidentList = <IncidentModel>[].obs;
  RxInt likeCount = 17.obs;
  RxInt dislikeCount = 5.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    locationController = TextEditingController();
    generateItems(20);
  }

  void generateItems(int numberOfItems) async {
    isLoading.value = true;
    List<IncidentModel> incidents;

    incidents = await IncidentService().getIncidents();

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
    isLoading.value = false;
  }

  AssetImage getIncidentIcon(String category) {
    switch (category) {
      case "Road Damage":
        {
          return AppImages.roadDamage;
        }

      case "Water Damage":
        {
          return AppImages.waterDamage;
        }
      case "Traffic Signs":
        {
          return AppImages.trafficSigns;
        }

      default:
        {
          return AppImages.imageNotFound;
        }
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

  Color getColor(String category) {
    switch (category) {
      case "Road Damage":
        {
          return AppColors.incidentRoadDamage;
        }

      case "Water Damage":
        {
          return AppColors.incidentWaterDamage;
        }
      case "Traffic Signs":
        {
          return AppColors.incidentTrafficSigns;
        }

      default:
        {
          return AppColors.greyTextColor;
        }
    }
  }
}
