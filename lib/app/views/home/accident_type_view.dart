import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home/incident_type_controller.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'incident_details_view.dart';

//color: Color(0xff78D8A4),
class AccidentTypeView extends GetView<IncidentTypeController> {
  const AccidentTypeView({super.key});

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
                  itemCount: 5,
                  itemBuilder: (context, index) => ListTile(
                      title: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    color: AppColors.containerBackground,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IncidentType(),
                        SizedBox(
                          height: 1.h,
                        ),
                        title(),
                      ],
                    ),
                  )),
                )),
          ],
        ),
      ),
    );
  }

  Text title() {
    return Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the",
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 106, 106, 106)),
    );
  }

  Row IncidentType() {
    return Row(
      children: [
        Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 33.0,
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          "Accident",
          style: TextStyle(
              color: Colors.red, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 30.w),
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
