import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common/navigation_drawer.dart';
import '../../controllers/settings/settings_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_images.dart';
import '../../theme/app_textstyles.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  final SettingsController controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Information",
                    style: TextStyle(
                        color: AppColors.blue2,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full Name",
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: GeneralAppDatas.fullNameSettings.value,
                            ),
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: GeneralAppDatas.birthDateSettings.value,
                            ),
                            onChanged: (value) {
                              // Girilen değeri birthdateValue değişkenine atayın
                              controller.birthdate.value = value;
                            },
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  GeneralAppDatas.phoneNumberSettings.value,
                            ),
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: GeneralAppDatas.userEmail.value,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "Change Password",
                    style: TextStyle(
                        color: Color.fromARGB(115, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 3.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Password",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 2.w, right: 2.w),
                          width: 100.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 235, 235, 235),
                          ),
                          child: TextField(
                            obscureText: controller.isPasswordHidden.value,
                            decoration: InputDecoration(
                                icon: const Icon(Icons.lock),
                                focusColor: AppColors.blue2,
                                iconColor: AppColors.blue2,
                                border: InputBorder.none,
                                suffix: InkWell(
                                  child: Icon(
                                    controller.isPasswordHidden.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                    size: 5.w,
                                  ),
                                  onTap: () {
                                    controller.isPasswordHidden.value =
                                        !controller.isPasswordHidden.value;
                                  },
                                )),
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
                        "Type Password Again",
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "*******",
                            ),
                          ))
                    ],
                  ),

                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "App Settings",
                    style: TextStyle(
                        color: AppColors.blue2,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Map Zoom",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 20.w,
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Color.fromARGB(255, 164, 186, 197),
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                //  controller: _controller,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: false,
                                  signed: true,
                                ),
                                // inputFormatters: <TextInputFormatter>[
                                //   WhitelistingTextInputFormatter.digitsOnly
                                // ],
                              ),
                            ),
                            Container(
                              height: 38.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 0.5,
                                        ),
                                      ),
                                    ),
                                    child: InkWell(
                                      child: Icon(
                                        Icons.arrow_drop_up,
                                        size: 18.0,
                                      ),
                                      // onTap: () {
                                      //   int currentValue = int.parse(_controller.text);
                                      //   setState(() {
                                      //     currentValue++;
                                      //     _controller.text = (currentValue)
                                      //         .toString(); // incrementing value
                                      //   });
                                      // },
                                    ),
                                  ),
                                  InkWell(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 18.0,
                                    ),
                                    // onTap: () {
                                    //   int currentValue = int.parse(_controller.text);
                                    //   setState(() {
                                    //     print("Setting state");
                                    //     currentValue--;
                                    //     _controller.text =
                                    //         (currentValue > 0 ? currentValue : 0)
                                    //             .toString(); // decrementing value
                                    //   });
                                    // },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Language",
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
                          width: 30.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 235, 235, 235),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "",
                            ),
                          ))
                    ],
                  ),

                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.updateUser();
                        },
                        child: Container(
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
        ),
      ),
    );
  }
}
