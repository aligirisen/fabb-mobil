import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class CustomNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(children: [
          buildDrawerHeader(),
          const Divider(
            color: Colors.grey,
          ),
          buildDrawerItem(
              text: "First",
              icon: Icon(Icons.person),
              onTap: () => navigate(0),
              tileColor: Get.currentRoute == Routes.login
                  ? Colors.blue
                  : Colors.transparent),
          buildDrawerItem(
              text: "Sec",
              icon: Icon(Icons.photo),
              onTap: () => navigate(1),
              tileColor: Get.currentRoute == Routes.login
                  ? Colors.blue
                  : Colors.transparent),
          buildDrawerItem(
              text: "Third",
              icon: Icon(Icons.close),
              onTap: () => navigate(2),
              tileColor: Get.currentRoute == Routes.login
                  ? Colors.blue
                  : Colors.transparent)
        ]),
      ),
    );
  }

  Widget buildDrawerHeader() {
    return const UserAccountsDrawerHeader(
      accountName: Text("Hello"),
      accountEmail: Text("deneme@gmail.com"),
      currentAccountPicture: Icon(Icons.person),
      currentAccountPictureSize: Size.square(50),
    );
  }

  Widget buildDrawerItem(
      {required String text,
      required Icon icon,
      required VoidCallback onTap,
      required Color tileColor}) {
    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: onTap,
      tileColor: tileColor,
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed("/firstPage");
    } else if (index == 1) {
      Get.toNamed("/secondPage");
    } else if (index == 2) {
      Get.toNamed("/thirdPage");
    } else {
      Get.toNamed("/home");
    }
  }
}
