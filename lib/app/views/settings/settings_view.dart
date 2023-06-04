import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../common/navigation_drawer.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_images.dart';
import '../../theme/app_textstyles.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: AppBar(
        toolbarHeight: 9.h,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: TextStyle(
                    color: AppColors.blue2,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "First Name",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          width: 40.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 235, 235, 235),
                          ),
                          child: TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Last Name",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          width: 40.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 235, 235, 235),
                          ),
                          child: TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Birthdate",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      width: 100.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 235, 235, 235),
                      ),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Number",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      width: 100.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 235, 235, 235),
                      ),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "E-mail",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      width: 100.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 235, 235, 235),
                      ),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      width: 100.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 235, 235, 235),
                      ),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 5.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      "Save Changes",
                      style: AppTextStyles.infoTextStyleLight,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 3.h,
              // ),
              // Text(
              //   "App",
              //   style: TextStyle(
              //       color: AppColors.blue2,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: 3.h,
              // ),
              // Text(
              //   "Language",
              //   style: TextStyle(
              //       fontSize: 13,
              //       fontWeight: FontWeight.w400,
              //       color: Colors.grey),
              // ),
            ]),
      ),
    );
  }
}
