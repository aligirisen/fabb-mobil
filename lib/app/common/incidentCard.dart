import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:sizer/sizer.dart';
import '../models/incident_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_images.dart';
import '../theme/app_strings.dart';
import '../theme/app_textstyles.dart';

Widget IncidentCard(IncidentModel incidentModel) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 1.h,
        ),
        incidentCategory(incidentModel),
        SizedBox(
          height: 1.h,
        ),
        incidentTitleText(incidentModel),
        SizedBox(
          height: 0.5.h,
        ),
        incidentDate(incidentModel),
        SizedBox(
          height: 1.h,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 1.h, left: 3.w, right: 5.w),
          //color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 15.h,
                  child: Image(
                    image:
                        NetworkImage(incidentModel.attachments![0].toString()),
                  )), // bu kısımda image nasıl gelmeli???
              //
            ],
          ),
        ),
        Container(
          //address?
          margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          width: 40.w,
          child: Text(incidentModel.description ?? "",
              style: AppTextStyles.incidentDescriptionTextStyle),
        ),
        addressText(incidentModel),
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
              statusButton(incidentModel),
              SizedBox(
                width: 5.w,
              ),
              LikeButton(
                size: 20,
                circleColor: const CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.thumb_up_alt_rounded,
                    color: isLiked ? AppColors.darkBlue : Colors.grey,
                    size: 20,
                  );
                },
                likeCount: incidentModel.upvoteCount ?? 0,
                countBuilder: (int? count, bool isLiked, String text) {
                  var color = isLiked ? AppColors.darkBlue : Colors.grey;
                  Widget result;
                  if (count == 0) {
                    result = Text(
                      "0",
                      style: TextStyle(color: color),
                    );
                  } else {
                    result = Text(
                      text,
                      style: TextStyle(color: color),
                    );
                  }
                  return result;
                },
              ),
              SizedBox(
                width: 5.w,
              ),
              LikeButton(
                size: 20,
                circleColor: const CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.thumb_down_alt_rounded,
                    color: isLiked ? AppColors.darkBlue : Colors.grey,
                    size: 20,
                  );
                },
                likeCount: incidentModel.downvoteCount ?? 0,
                countBuilder: (int? count, bool isLiked, String text) {
                  var color = isLiked ? AppColors.darkBlue : Colors.grey;
                  Widget result;
                  if (count == 0) {
                    result = Text(
                      "0",
                      style: TextStyle(color: color),
                    );
                  } else {
                    result = Text(
                      text,
                      style: TextStyle(color: color),
                    );
                  }
                  return result;
                },
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Container statusButton(IncidentModel incidentModel) {
  return Container(
    alignment: Alignment.center,
    height: 4.h,
    width: 30.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: getSatusColor(incidentModel.incidentStatus ?? ""),
    ),
    child: Text(
      incidentModel.incidentStatus ?? "",
      style: const TextStyle(color: Colors.white, fontSize: 13),
    ),
  );
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

Container addressText(IncidentModel incidentModel) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 1.h,
      left: 3.w,
    ),
    child: Text(
      incidentModel.address ?? "",
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

Text incidentDate(IncidentModel incidentModel) {
  return Text(
    incidentModel.createDate ?? "",
    style: const TextStyle(
        color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w400),
  );
}

Text incidentTitleText(IncidentModel incidentModel) {
  return Text(
    incidentModel.title ?? "",
    style: AppTextStyles.incidentTitleTextStyle,
  );
}

Row incidentCategory(IncidentModel incidentModel) {
  return Row(
    children: [
      SizedBox(
        height: 4.h,
        child: Image(image: getIncidentIcon(incidentModel.category ?? "")),
      ),
      SizedBox(
        width: 2.w,
      ),
      Text(
        incidentModel.category ?? "null",
        style: TextStyle(
            color: getColor(incidentModel.category ?? ""),
            fontSize: 17,
            fontWeight: FontWeight.w600),
      )
    ],
  );
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
