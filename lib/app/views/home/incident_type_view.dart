import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home/incident_type_controller.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'incident_details_view.dart';

//color: Color(0xff78D8A4),
class IncidentTypeView extends GetView<IncidentTypeController> {
  const IncidentTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<IncidentTypeController>(
      () => IncidentTypeController(),
    );
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 9.h,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),
          backgroundColor: AppColors.darkBlue,
          title: Text("Start a New Incident")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Text(
                "Select an incident type",
                style: TextStyle(color: Color.fromARGB(255, 93, 93, 93)),
              ),
            ),
            Container(
                height: 100.h,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: ListView.builder(
                  itemCount: controller.incidentTypes.length,
                  itemBuilder: (context, index) => ListTile(
                      title: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    color: AppColors.containerBackground,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IncidentType(index),
                        SizedBox(
                          height: 1.h,
                        ),
                        text(index),
                      ],
                    ),
                  )),
                )),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      ),
    );
  }

  Text text(int index) {
    return Text(
      "${controller.incidentTypes[index].text}",
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 106, 106, 106)),
    );
  }

  Row IncidentType(int index) {
    return Row(
      children: [
        Image(
          height: 5.h,
          image: controller.incidentTypes[index].icon,
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          "${controller.incidentTypes[index].title}",
          style: TextStyle(
              color: controller.incidentTypes[index].color,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        Spacer(),
        ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(100, 25)),
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ))),
          onPressed: () {
            GeneralAppDatas.selectedIncidentType.value =
                controller.incidentTypes[index].title;
            Get.toNamed(Routes.incidentDetails);
          },
          child: Text(
            "Start",
            style: TextStyle(color: AppColors.greyTextColor),
          ),
        )
      ],
    );
  }
}
