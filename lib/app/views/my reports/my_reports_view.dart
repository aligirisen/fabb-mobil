import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:sizer/sizer.dart';

import '../../common/navigation_drawer.dart';
import '../../controllers/home/list_view_controller.dart';
import '../../controllers/my_reports/my_reports_controller.dart';
import '../../general_app_datas/general_app_datas.dart';
import '../../models/incident_model.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_images.dart';
import '../../theme/app_textstyles.dart';

class MyReportsView extends GetView<MyReportsController> {
  const MyReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MyReportsController>(
      () => MyReportsController(),
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const CustomNavigationDrawer(),
        appBar: AppBar(
          toolbarHeight: 9.h,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),
          backgroundColor: AppColors.darkBlue,
          title: Text("My Reports"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  myReportCount(AppColors.greyTextColor),
                  Divider(
                    height: 2.h,
                    thickness: 10,
                    color: Colors.grey,
                  ),
                  solvedReportCount(Colors.green),
                  Icon(
                    Icons.circle,
                    color: Colors.grey,
                    size: 7,
                  ),
                  inProgressReportCount(Colors.blue),
                  Icon(
                    Icons.circle,
                    color: Colors.grey,
                    size: 7,
                  ),
                  rejectedReportCount(Colors.red)
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
                height: 4.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.darkBlue),
                    borderRadius: BorderRadius.circular(15)),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius: BorderRadius.circular(15)),
                    labelColor: AppColors.lightWords,
                    unselectedLabelColor: AppColors.darkBlue,
                    tabs: const [
                      Tab(
                        text: 'My Reports',
                      ),
                      Tab(
                        text: 'Likes',
                      ),
                      Tab(
                        text: 'Dislikes',
                      )
                    ]),
              ),
              Container(
                height: 73.h,
                padding: EdgeInsets.only(bottom: 2.h),
                child: Obx(
                  () => controller.isLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColors.darkBlue,
                        ))
                      : Container(
                          margin: const EdgeInsets.all(5),
                          child: ListView.builder(
                            itemCount: GeneralAppDatas.myIncidentList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 2.w, horizontal: 1.h),
                                decoration: BoxDecoration(
                                    color: AppColors.listViewContainerColor,
                                    border: Border.symmetric(
                                      vertical: BorderSide.none,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    collapsedBackgroundColor: Colors
                                        .transparent, // Kapalı durum arka plan rengini transparan yapar
                                    backgroundColor: Colors
                                        .transparent, // Başlığın sonundaki simgeyi kaldırır
                                    childrenPadding: EdgeInsets.zero,
                                    //  dividerColor: Colors.transparent,
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        incidentCategory(index),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        incidentTitleText(index),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        incidentDate(index),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 1.h,
                                                  left: 3.w,
                                                  right: 5.w),
                                              //color: Colors.white,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: 15.h,
                                                      child: Image(
                                                        image: NetworkImage(
                                                            GeneralAppDatas
                                                                .myIncidentList[
                                                                    index]
                                                                .attachments![0]
                                                                .toString()),
                                                      )), // bu kısımda image nasıl gelmeli???
                                                  //
                                                ],
                                              ),
                                            ),
                                            Container(
                                              //address?
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.h),
                                              width: 40.w,
                                              child: Text(
                                                  GeneralAppDatas
                                                          .myIncidentList[index]
                                                          .description ??
                                                      "",
                                                  style: AppTextStyles
                                                      .incidentDescriptionTextStyle),
                                            ),
                                            addressText(index),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                bottom: 3.h,
                                                left: 3.w,
                                              ),
                                              child: Row(
                                                children: [
                                                  statusButton(index),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Row(
                                                    children: [
                                                      LikeButton(
                                                        size: 20,
                                                        circleColor:
                                                            const CircleColor(
                                                                start: Color(
                                                                    0xff00ddff),
                                                                end: Color(
                                                                    0xff0099cc)),
                                                        bubblesColor:
                                                            const BubblesColor(
                                                          dotPrimaryColor:
                                                              Color(0xff33b5e5),
                                                          dotSecondaryColor:
                                                              Color(0xff0099cc),
                                                        ),
                                                        likeBuilder:
                                                            (bool isLiked) {
                                                          return Icon(
                                                            Icons
                                                                .thumb_up_alt_rounded,
                                                            color: isLiked
                                                                ? AppColors
                                                                    .darkBlue
                                                                : Colors.grey,
                                                            size: 20,
                                                          );
                                                        },
                                                        likeCount: GeneralAppDatas
                                                                .myIncidentList[
                                                                    index]
                                                                .upvoteCount ??
                                                            0,
                                                        countBuilder:
                                                            (int? count,
                                                                bool isLiked,
                                                                String text) {
                                                          var color = isLiked
                                                              ? AppColors
                                                                  .darkBlue
                                                              : Colors.grey;
                                                          Widget result;
                                                          if (count == 0) {
                                                            result = Text(
                                                              "0",
                                                              style: TextStyle(
                                                                  color: color),
                                                            );
                                                          } else
                                                            result = Text(
                                                              text,
                                                              style: TextStyle(
                                                                  color: color),
                                                            );
                                                          return result;
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      LikeButton(
                                                        size: 20,
                                                        circleColor:
                                                            const CircleColor(
                                                                start: Color(
                                                                    0xff00ddff),
                                                                end: Color(
                                                                    0xff0099cc)),
                                                        bubblesColor:
                                                            const BubblesColor(
                                                          dotPrimaryColor:
                                                              Color(0xff33b5e5),
                                                          dotSecondaryColor:
                                                              Color(0xff0099cc),
                                                        ),
                                                        likeBuilder:
                                                            (bool isLiked) {
                                                          return Icon(
                                                            Icons
                                                                .thumb_down_alt_rounded,
                                                            color: isLiked
                                                                ? AppColors
                                                                    .darkBlue
                                                                : Colors.grey,
                                                            size: 20,
                                                          );
                                                        },
                                                        likeCount: GeneralAppDatas
                                                                .myIncidentList[
                                                                    index]
                                                                .downvoteCount ??
                                                            0,
                                                        countBuilder:
                                                            (int? count,
                                                                bool isLiked,
                                                                String text) {
                                                          var color = isLiked
                                                              ? AppColors
                                                                  .darkBlue
                                                              : Colors.grey;
                                                          Widget result;
                                                          if (count == 0) {
                                                            result = Text(
                                                              "0",
                                                              style: TextStyle(
                                                                  color: color),
                                                            );
                                                          } else
                                                            result = Text(
                                                              text,
                                                              style: TextStyle(
                                                                  color: color),
                                                            );
                                                          return result;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5.w,
                                                        bottom: 2.h),
                                                    height: 4.h,
                                                    width: 8.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Color.fromARGB(
                                                          255, 229, 229, 229),
                                                    ),
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ]),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column myReportCount(Color color) {
    return Column(
      children: [
        Text(
          "37",
          style: TextStyle(color: color, fontSize: 30),
        ),
        Text(
          "total reports",
          style: TextStyle(color: color, fontSize: 12),
        )
      ],
    );
  }

  Column solvedReportCount(Color color) {
    return Column(
      children: [
        Text(
          "11",
          style: TextStyle(color: color, fontSize: 30),
        ),
        Text(
          "solved",
          style: TextStyle(color: color, fontSize: 12),
        )
      ],
    );
  }

  Column inProgressReportCount(Color color) {
    return Column(
      children: [
        Text(
          "12",
          style: TextStyle(color: color, fontSize: 30),
        ),
        Text(
          "in progress",
          style: TextStyle(color: color, fontSize: 12),
        )
      ],
    );
  }

  Column rejectedReportCount(Color color) {
    return Column(
      children: [
        Text(
          "3",
          style: TextStyle(color: color, fontSize: 30),
        ),
        Text(
          "rejected",
          style: TextStyle(color: color, fontSize: 12),
        )
      ],
    );
  }

  Text incidentTitleText(int index) {
    return Text(
      GeneralAppDatas.myIncidentList[index].title ?? "",
      style: AppTextStyles.incidentTitleTextStyle,
    );
  }

  Container statusButton(int index) {
    return Container(
      alignment: Alignment.center,
      height: 4.h,
      width: 30.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: controller.getSatusColor(
            GeneralAppDatas.myIncidentList[index].incidentStatus ?? ""),
      ),
      child: Text(
        GeneralAppDatas.myIncidentList[index].incidentStatus ?? "",
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }

  Container addressText(int index) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 1.h,
        left: 3.w,
      ),
      child: Text(
        GeneralAppDatas.myIncidentList[index].address ?? "",
        overflow: TextOverflow.ellipsis,
        maxLines: 7,
        softWrap: false,
        style: const TextStyle(
            color: Color.fromARGB(255, 121, 121, 121),
            fontSize: 13,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Text incidentDate(int index) {
    return Text(
      GeneralAppDatas.myIncidentList[index].createDate ?? "",
      style: const TextStyle(
          color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w400),
    );
  }

  Text title() {
    return const Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the",
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 106, 106, 106)),
    );
  }

  Row incidentCategory(int index) {
    return Row(
      children: [
        SizedBox(
          height: 4.h,
          child: Image(
              image: controller.getIncidentIcon(
                  GeneralAppDatas.myIncidentList[index].category ?? "")),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          GeneralAppDatas.myIncidentList[index].category ?? "null",
          style: TextStyle(
              color: controller.getColor(
                  GeneralAppDatas.myIncidentList[index].category ?? ""),
              fontSize: 17,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}


// child: Obx(() => ExpansionPanelList(
//               expansionCallback: (panelIndex, isExpanded) {
//                 controller.incidents[panelIndex].isExpanded.value = !isExpanded;
//               },
//               children:
//                   controller.incidents.map<ExpansionPanel>((Incident item) {
//                 return ExpansionPanel(
//                     canTapOnHeader: true,
//                     headerBuilder: ((context, isExpanded) {
//                       return ListTile(title: Text(item.name));
//                     }),
//                     body: ListTile(
//                       title: Text(item.incidentid),
//                     ),
//                     isExpanded: item.isExpanded.value);
//               }).toList())),