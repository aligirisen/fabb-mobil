import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:sizer/sizer.dart';

import '../../common/navigation_drawer.dart';
import '../../controllers/home/list_view_controller.dart';
import '../../general_app_datas/general_app_datas.dart';
import '../../models/incident_model.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_images.dart';
import '../../theme/app_textstyles.dart';

class MyReportsView extends GetView<ListViewController> {
  const MyReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ListViewController>(
      () => ListViewController(),
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
              // Align(
              //   alignment: Alignment.topRight,
              //   child: GestureDetector(
              //     onTap: () {
              //       Get.toNamed(Routes.home);
              //     },
              //     child: Padding(
              //         padding: const EdgeInsets.all(20),
              //         child: Icon(
              //           Icons.close,
              //           color: Colors.black,
              //           size: 35,
              //         )),
              //   ),
              // ),
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
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Obx(
                  () => Container(
                    height: 100.h,
                    margin: EdgeInsets.all(5),
                    child: ListView.builder(
                      itemCount: GeneralAppDatas.incidentList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: AppColors.containerBackground,
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.symmetric(
                            vertical: 2.h,
                          ),
                          child: ExpansionTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                category(index),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  GeneralAppDatas.incidentList[index].title ??
                                      "",
                                  style: AppTextStyles.incidentTitleTextStyle,
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                incidentDate(index),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                    GeneralAppDatas
                                            .incidentList[index].description ??
                                        "",
                                    style: AppTextStyles
                                        .incidentDescriptionTextStyle),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                            children: [
                              Column(children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 2.h,
                                  ),
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: 15.h,
                                          child: Image(
                                              image: AppImages
                                                  .car)), // bu kısımda image nasıl gelmeli???
                                      Container(
                                        //address?
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 2.h),
                                        width: 40.w,
                                        child: Text(
                                          GeneralAppDatas.incidentList[index]
                                                  .address ??
                                              "",
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
                                  margin: EdgeInsets.only(
                                      bottom: 3.h, left: 3.w, right: 3.w),
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 4.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: controller.getSatusColor(
                                              GeneralAppDatas
                                                      .incidentList[index]
                                                      .incidentStatus ??
                                                  ""),
                                        ),
                                        child: Text(
                                          GeneralAppDatas.incidentList[index]
                                                  .incidentStatus ??
                                              "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      LikeButton(
                                        size: 20,
                                        circleColor: CircleColor(
                                            start: Color(0xff00ddff),
                                            end: Color(0xff0099cc)),
                                        bubblesColor: BubblesColor(
                                          dotPrimaryColor: Color(0xff33b5e5),
                                          dotSecondaryColor: Color(0xff0099cc),
                                        ),
                                        likeBuilder: (bool isLiked) {
                                          return Icon(
                                            Icons.thumb_up_alt_rounded,
                                            color: isLiked
                                                ? AppColors.darkBlue
                                                : Colors.grey,
                                            size: 20,
                                          );
                                        },
                                        likeCount: GeneralAppDatas
                                                .incidentList[index]
                                                .upvoteCount ??
                                            0,
                                        countBuilder: (int? count, bool isLiked,
                                            String text) {
                                          var color = isLiked
                                              ? AppColors.darkBlue
                                              : Colors.grey;
                                          Widget result;
                                          if (count == 0) {
                                            result = Text(
                                              "0",
                                              style: TextStyle(color: color),
                                            );
                                          } else
                                            result = Text(
                                              text,
                                              style: TextStyle(color: color),
                                            );
                                          return result;
                                        },
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      LikeButton(
                                        size: 20,
                                        circleColor: CircleColor(
                                            start: Color(0xff00ddff),
                                            end: Color(0xff0099cc)),
                                        bubblesColor: BubblesColor(
                                          dotPrimaryColor: Color(0xff33b5e5),
                                          dotSecondaryColor: Color(0xff0099cc),
                                        ),
                                        likeBuilder: (bool isLiked) {
                                          return Icon(
                                            Icons.thumb_down_alt_rounded,
                                            color: isLiked
                                                ? AppColors.darkBlue
                                                : Colors.grey,
                                            size: 20,
                                          );
                                        },
                                        likeCount: GeneralAppDatas
                                                .incidentList[index]
                                                .downvoteCount ??
                                            0,
                                        countBuilder: (int? count, bool isLiked,
                                            String text) {
                                          var color = isLiked
                                              ? AppColors.darkBlue
                                              : Colors.grey;
                                          Widget result;
                                          if (count == 0) {
                                            result = Text(
                                              "0",
                                              style: TextStyle(color: color),
                                            );
                                          } else
                                            result = Text(
                                              text,
                                              style: TextStyle(color: color),
                                            );
                                          return result;
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ],
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

  Text incidentDate(int index) {
    return Text(
      GeneralAppDatas.incidentList[index].createDate ?? "",
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

  Row category(int index) {
    return Row(
      children: [
        Container(
          height: 5.h,
          child: Image(
              image: controller.getIncidentIcon(
                  GeneralAppDatas.incidentList[index].category ?? "")),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          GeneralAppDatas.incidentList[index].category ?? "null",
          style: TextStyle(
              color: controller
                  .getColor(GeneralAppDatas.incidentList[index].category ?? ""),
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