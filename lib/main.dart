import 'package:fabb_mobil/app/controllers/auth%20pages/login_controller.dart';
import 'package:fabb_mobil/app/general_app_datas/base_urls.dart';
import 'package:fabb_mobil/app/views/auth%20pages/login_view.dart';
import 'package:fabb_mobil/app/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'app/bindings/all_bindings.dart';
import 'app/general_app_datas/general_app_datas.dart';
import 'app/routes/app_pages.dart';
import 'app/services/user_service.dart';
import 'app/theme/app_strings.dart';

const baseUrl = BaseUrls.baseUrl;
void main() async {
  await GetStorage.init();
  GeneralAppDatas().checkLoggedInStatus();
  if (GeneralAppDatas.userId.isNotEmpty) {
    UserService().getUserDatas(GeneralAppDatas.userId.value);
  }
  print(GeneralAppDatas.isLoggedIn);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        initialBinding: AllControllerBinding(),
        initialRoute:
            GeneralAppDatas.isLoggedIn.value ? AppPages.home : AppPages.login,
        getPages: AppPages.routes,
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
