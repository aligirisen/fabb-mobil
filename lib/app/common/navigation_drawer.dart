import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../routes/app_pages.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 60.w,
      backgroundColor: AppColors.darkBlue,
      child: ListView(children: [
        buildDrawerHeader(),
        buildDrawerItem(
            text: "Home",
            onTap: () => navigate(0),
            tileColor: Get.currentRoute == Routes.home
                ? AppColors.chosendrawer
                : Colors.transparent),
        buildDrawerItem(
            text: "My Reports",
            onTap: () => navigate(1),
            tileColor: Get.currentRoute == Routes.myreports
                ? AppColors.chosendrawer
                : Colors.transparent),
        buildDrawerItem(
            text: "Settings",
            onTap: () => navigate(2),
            tileColor: Get.currentRoute == Routes.settings
                ? AppColors.chosendrawer
                : Colors.transparent),
        buildDrawerItem(
            text: "Contact",
            onTap: () => navigate(3),
            tileColor: Get.currentRoute == Routes.contact
                ? AppColors.chosendrawer
                : Colors.transparent)
      ]),
    );
  }

  Widget buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.only(left: 5.w),
      accountName: const Text(
        "Fabb App",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
      accountEmail: const Text("deneme@gmail.com",
          style: TextStyle(fontWeight: FontWeight.w500)),
      currentAccountPicture: Image(image: AppImages.logo),
      currentAccountPictureSize: const Size.square(70),
      decoration: BoxDecoration(color: AppColors.darkBlue),
    );
  }

  Widget buildDrawerItem(
      {required String text,
      required VoidCallback onTap,
      required Color tileColor}) {
    return Container(
      margin: EdgeInsets.only(left: 5.w),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
              color: AppColors.lightWords,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        onTap: onTap,
        tileColor: tileColor,
      ),
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed("/home");
    } else if (index == 1) {
      Get.toNamed("/myreports");
    } else if (index == 2) {
      Get.toNamed("/settings");
    } else {
      Get.toNamed("/contact");
    }
  }
}
