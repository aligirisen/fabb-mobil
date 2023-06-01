import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home/list_view_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_textstyles.dart';

//color: Color(0xff78D8A4),
class MapListView extends StatelessWidget {
  MapListView({super.key});

  final ListViewController controller = Get.put(ListViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.isLoading.value == true
          ? Center(
              child: CircularProgressIndicator(
              color: AppColors.darkBlue,
            ))
          : Container(
              height: 100.h,
              margin: const EdgeInsets.all(5),
              child: ListView.builder(
                itemCount: GeneralAppDatas.incidentListList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 2.w, horizontal: 1.h),
                    decoration: BoxDecoration(
                        color: AppColors.listViewContainerColor,
                        border: Border.symmetric(
                          vertical: BorderSide.none,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        collapsedBackgroundColor: Colors
                            .transparent, // Kapalı durum arka plan rengini transparan yapar
                        backgroundColor: Colors
                            .transparent, // Başlığın sonundaki simgeyi kaldırır
                        childrenPadding: EdgeInsets.zero,
                        //  dividerColor: Colors.transparent,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 1.h, left: 3.w, right: 5.w),
                                  //color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 15.h,
                                          child: Image(
                                            image: NetworkImage(GeneralAppDatas
                                                .incidentListList[index]
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
                                      horizontal: 3.w, vertical: 1.h),
                                  width: 40.w,
                                  child: Text(
                                      GeneralAppDatas.incidentListList[index]
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
                                      LikeButton(
                                        size: 20,
                                        circleColor: const CircleColor(
                                            start: Color(0xff00ddff),
                                            end: Color(0xff0099cc)),
                                        bubblesColor: const BubblesColor(
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
                                                .incidentListList[index]
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
                                        circleColor: const CircleColor(
                                            start: Color(0xff00ddff),
                                            end: Color(0xff0099cc)),
                                        bubblesColor: const BubblesColor(
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
                                                .incidentListList[index]
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
                    ),
                  );
                },
              ),
            ),
    ));
  }

  Text incidentTitleText(int index) {
    return Text(
      GeneralAppDatas.incidentListList[index].title ?? "",
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
            GeneralAppDatas.incidentListList[index].incidentStatus ?? ""),
      ),
      child: Text(
        GeneralAppDatas.incidentListList[index].incidentStatus ?? "",
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
        GeneralAppDatas.incidentListList[index].address ?? "",
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
      GeneralAppDatas.incidentListList[index].createDate ?? "",
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
                  GeneralAppDatas.incidentListList[index].category ?? "")),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          GeneralAppDatas.incidentListList[index].category ?? "null",
          style: TextStyle(
              color: controller.getColor(
                  GeneralAppDatas.incidentListList[index].category ?? ""),
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
