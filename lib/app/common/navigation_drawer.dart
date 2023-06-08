import 'package:fabb_mobil/app/controllers/settings/settings_controller.dart';
import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';
import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/auth pages/login_controller.dart';
import '../controllers/auth pages/signup_controller.dart';
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
        Obx(
          () => GeneralAppDatas.isLoggedIn.value == true
              ? buildDrawerItem(
                  text: "My Reports",
                  onTap: () => navigate(1),
                  tileColor: Get.currentRoute == Routes.myreports
                      ? AppColors.chosendrawer
                      : Colors.transparent)
              : Container(),
        ),
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
                : Colors.transparent),
        Obx(
          () => GeneralAppDatas.isLoggedIn.value == false
              ? Container()
              : buildDrawerItem(
                  text: "Logout",
                  onTap: () => showLogoutConfirmationDialog(),
                  tileColor: Colors.transparent,
                ),
        ),
        Obx(() => GeneralAppDatas.isLoggedIn.value == false
            ? Column(
                children: [
                  buildDrawerItemLogin(
                      text: "Log In",
                      onTap: () => navigate(4),
                      tileColor: Colors.transparent),
                  buildDrawerItemLogin(
                      text: "Create Account",
                      onTap: () => navigate(5),
                      tileColor: Colors.transparent),
                ],
              )
            : Container())

        // Container(
        //     height: 5.h,
        //     width: 10,
        //     decoration: BoxDecoration(
        //         color: Colors.amber,
        //         borderRadius: BorderRadius.circular(10)),
        //     child: Text("login"),
        //   )
      ]),
    );
  }

  Widget buildDrawerItemLogin(
      {required String text,
      required VoidCallback onTap,
      required Color tileColor}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      // margin: EdgeInsets.only(right: 14.w),
      child: ListTile(
        title: Container(
          padding: EdgeInsets.only(left: 6.w),
          alignment: Alignment.centerLeft,
          height: 5.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 90, 127, 152)),
          child: Text(
            text,
            style: TextStyle(
                color: AppColors.lightWords,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        onTap: onTap,
        tileColor: tileColor,
      ),
    );
  }

  Widget buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.only(left: 5.w),
      accountName: const Text(
        "Fabb App",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
      accountEmail: Text(GeneralAppDatas.userEmail.value,
          style: const TextStyle(fontWeight: FontWeight.w500)),
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
      Get.toNamed(Routes.home);
    } else if (index == 1) {
      //  MyReportsController.to.initialize();
      Get.toNamed(Routes.myreports);
    } else if (index == 2) {
      Get.put(SettingsController());
      SettingsController.to.initialize();
      Get.toNamed(Routes.settings);
    } else if (index == 3) {
      Get.toNamed(Routes.contact);
    } else if (index == 4) {
      LoginController.to.initialize();
      Get.toNamed(Routes.login);
    } else if (index == 5) {
      SignupController.to.initialize();
      Get.toNamed(Routes.signup);
    } else {
      Get.toNamed(Routes.home); //default
    }
  }

  void showLogoutConfirmationDialog() {
    showDialog(
      context: Get.overlayContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                GeneralAppDatas.userId.value = "";
                GeneralAppDatas.userEmail.value = "";
                GeneralAppDatas.isLoggedIn.value = false;
                GeneralAppDatas.box.write('isLoggedIn', false);
                GeneralAppDatas.box.write("userId", "");
                Get.toNamed(Routes.login);
              },
            ),
          ],
        );
      },
    );
  }
}
