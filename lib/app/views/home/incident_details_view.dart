import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home/incident_type_controller.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_textstyles.dart';

//color: Color(0xff78D8A4),
class IncidentDetailsView extends GetView<IncidentTypeController> {
  const IncidentDetailsView({super.key});

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
            title: Text("Accident")), //seçilen incident type buraya gelecek
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Report Number"),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "AEF2482948",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  width: 100.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppColors.mainColor)),
                ),
                SizedBox(
                  height: 3.h,
                ),

                //title
                Text("Title"),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(""),
                  ),
                  width: 100.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppColors.mainColor)),
                ),
                SizedBox(
                  height: 3.h,
                ),

                Row(
                  children: [
                    Container(
                        height: 10.h,
                        width: 24.5.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: AppColors.darkBlue,
                        )),
                    Container(
                      padding: EdgeInsets.only(left: 5.w),
                      alignment: Alignment.centerLeft,
                      height: 10.h,
                      width: 65.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: AppColors.blue2,
                      ),
                      child: Text(
                        "Take a Photo or Video",
                        style: AppTextStyles.infoTextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Container(
                        height: 10.h,
                        width: 24.5.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: AppColors.darkBlue,
                        )),
                    Container(
                      padding: EdgeInsets.only(left: 5.w),
                      alignment: Alignment.centerLeft,
                      height: 10.h,
                      width: 65.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: AppColors.blue2,
                      ),
                      child: Text(
                        "Select From Library",
                        style: AppTextStyles.infoTextStyle,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),

                //title
                Text("Description"),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 3.w, top: 2.h, bottom: 2.h, right: 3.w),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitatio..."),
                  ),
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppColors.mainColor)),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  height: 3.h,
                ),

                //title
                Text("Address"),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 3.w, top: 2.h, bottom: 2.h, right: 3.w),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitatio..."),
                  ),
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppColors.mainColor)),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.succcesfulyReportedPage);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 7.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          "Report",
                          style: AppTextStyles.infoTextStyle,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
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
          "heyy",
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
          onPressed: () {},
          child: Text(
            "Start",
            style: TextStyle(color: AppColors.greyTextColor),
          ),
        )
      ],
    );
  }
}
