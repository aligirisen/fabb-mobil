import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home/incident_category_controller.dart';
import '../../routes/app_pages.dart';
import '../../shared/category_list.dart';
import '../../theme/app_colors.dart';

//color: Color(0xff78D8A4),
class IncidentCategoryView extends GetView<IncidentCategoryController> {
  const IncidentCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<IncidentCategoryController>(
      () => IncidentCategoryController(),
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
                "Select a category",
                style: TextStyle(color: Color.fromARGB(255, 93, 93, 93)),
              ),
            ),
            Container(
                height: 100.h,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: ListView.builder(
                  itemCount: CategoryList.incidentTypes.length,
                  itemBuilder: (context, index) => ListTile(
                      title: GestureDetector(
                    onTap: () {
                      GeneralAppDatas.selectedIncidentType.value =
                          CategoryList.incidentTypes[index].title;
                      Get.toNamed(Routes.incidentDetails);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
      "${CategoryList.incidentTypes[index].text}",
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 106, 106, 106)),
    );
  }

  Widget IncidentType(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image(
              height: 5.h,
              image: CategoryList.incidentTypes[index].icon,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              "${CategoryList.incidentTypes[index].title}",
              maxLines: 2,
              overflow: TextOverflow.visible,
              style: TextStyle(
                  color: CategoryList.incidentTypes[index].color,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Icon(Icons.chevron_right_rounded)
        // Spacer(),
        // ElevatedButton(
        //   style: ButtonStyle(
        //       fixedSize: MaterialStateProperty.all(const Size(100, 25)),
        //       backgroundColor:
        //           MaterialStateColor.resolveWith((states) => Colors.white),
        //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //           RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(5.0),
        //       ))),
        //   onPressed: () {
        //     GeneralAppDatas.selectedIncidentType.value =
        //         CategoryList.incidentTypes[index].title;
        //     Get.toNamed(Routes.incidentDetails);
        //   },
        //   child: Text(
        //     "Start",
        //     style: TextStyle(color: AppColors.greyTextColor),
        //   ),
        // )
      ],
    );
  }
}
