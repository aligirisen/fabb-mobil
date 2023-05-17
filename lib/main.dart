import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_strings.dart';

const baseUrl = 'http://192.168.1.78:5111';
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
