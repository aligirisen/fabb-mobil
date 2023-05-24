import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../common/navigation_drawer.dart';
import '../../theme/app_colors.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: AppBar(
        toolbarHeight: 9.h,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        title: Text("Contact Us"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            AppImages.contact,
            Icon(
              Icons.email_outlined,
              size: 6.h,
              weight: 5,
              color: AppColors.darkBlue,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "fabbsoft@gmail.com",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.darkBlue,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Icon(
              Icons.phone_android_outlined,
              size: 6.h,
              weight: 5,
              color: AppColors.darkBlue,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text("+90 599 999 99 99",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkBlue,
                ))
          ]),
    );
  }
}
