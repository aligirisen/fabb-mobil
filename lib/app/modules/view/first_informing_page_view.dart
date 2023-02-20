import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/app_colors.dart';

class FirstInformingPageView extends StatelessWidget {
  const FirstInformingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: Text('ff'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.sunny,
            ),
            onPressed: () {
              context.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
            },
          )
        ],
      ),
    );
  }
}
