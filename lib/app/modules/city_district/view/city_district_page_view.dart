import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../theme/app_colors.dart';
import '../controller/city_district_page_controller.dart';
import 'city_district_shimmer.dart';

class CityDistrictPageView extends StatelessWidget {
  CityDistrictPageView({super.key});

  final homeController = Get.put(CityDistrictPageController());
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEE, MMM d, ' 'yy').format(now);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          elevation: 0,
          title: Text(formattedDate),
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
        body: Obx(() {
          return homeController.citiesLoading.value
              ? loaderForCityDistrict()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(bottom: 100, top: 100),
                      child: const Text(
                        'City-District',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    ),
                    Container(
                      width: 50.w,
                      alignment: Alignment.center,
                      //padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                      color: Colors.blueGrey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                value: homeController.selectedCity.value,
                                iconSize: 30,
                                icon: (null),
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                                hint: const Text('Select City'),
                                onChanged: homeController.cityOnChange,
                                items: homeController.cityList.map((item) {
                                  return DropdownMenuItem(
                                    value: item.id.toString(),
                                    child: Text(item.name),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 40.w,
                      color: Colors.blueGrey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Obx(() => IgnorePointer(
                                ignoring: homeController.ignoreDistrict.value,
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                        value: homeController
                                            .selectedDistrict.value,
                                        iconSize: 30,
                                        icon: (null),
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                        ),
                                        hint: const Text('Select District'),
                                        onChanged:
                                            homeController.districtOnChange,
                                        items: homeController.districtList
                                            .map((item) {
                                          return DropdownMenuItem(
                                            value: item.id.toString(),
                                            child: Text(item.name),
                                          );
                                        }).toList()),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                );
        }));
  }
}
