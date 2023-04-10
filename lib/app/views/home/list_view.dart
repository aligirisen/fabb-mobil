import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home/list_view_controller.dart';
import '../../models/incident_model.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_images.dart';

//color: Color(0xff78D8A4),
class ExpansionPanelView extends GetView<ExpansionPanelController> {
  const ExpansionPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ExpansionPanelController>(
      () => ExpansionPanelController(),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child: Obx(() => Container(
                child: ExpansionPanelList(
                    expansionCallback: (panelIndex, isExpanded) {
                      controller.employee[panelIndex].isExpanded.value =
                          !isExpanded;
                    },
                    children: controller.employee
                        .map<ExpansionPanel>((Employee item) {
                      return ExpansionPanel(
                          backgroundColor: Color(0xffF7F7F7),
                          canTapOnHeader: true,
                          headerBuilder: ((context, isExpanded) {
                            return ListTile(
                                title: Container(
                              margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IncidentType(),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  title(),
                                  incidentDate()
                                ],
                              ),
                            ));
                          }),
                          body: ListTile(
                            title: Column(children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 2.h),
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 15.h,
                                        child: Image(image: AppImages.car)),
                                    Container(
                                      //address?
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 3.w, vertical: 2.h),
                                      width: 40.w,
                                      child: Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 7,
                                        softWrap: false,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 121, 121, 121),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 3.h),
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 4.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff78D8A4),
                                      ),
                                      child: Text(
                                        "In Progress",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text("12", style: TextStyle(fontSize: 13)),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Icon(
                                      Icons.thumb_up_alt_rounded,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text("4", style: TextStyle(fontSize: 13)),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Icon(
                                      Icons.thumb_down_alt_rounded,
                                      size: 20,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ),
                          isExpanded: item.isExpanded.value);
                    }).toList()),
              )),
        ),
      ),
    );
  }

  Text incidentDate() {
    return Text(
      "12 Dec 2023 12:34:23",
      style: TextStyle(
          color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w400),
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
        )
      ],
    );
  }
}
