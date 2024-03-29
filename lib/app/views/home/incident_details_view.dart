import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';
import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/home/incident_details_controller.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_textstyles.dart';

//color: Color(0xff78D8A4),
class IncidentDetailsView extends StatelessWidget {
  IncidentDetailsView({super.key});

  final IncidentDetailsController controller =
      Get.put(IncidentDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 9.h,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(0),
              ),
            ),
            backgroundColor: AppColors.darkBlue,
            title: Text(GeneralAppDatas.selectedIncidentType
                .value)), //seçilen incident type buraya gelecek
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Report Number"),
                  SizedBox(
                    height: 2.h,
                  ),
                  reportTextField(2.h),
                  SizedBox(
                    height: 3.h,
                  ),

                  //title
                  Text("Title"),
                  SizedBox(
                    height: 2.h,
                  ),
                  titleTextField(2.h),

                  SizedBox(
                    height: 3.h,
                  ),
                  photoPickerContainer(),
                  SizedBox(
                    height: 3.h,
                  ),
                  //title
                  Text("Description"),
                  SizedBox(
                    height: 2.h,
                  ),
                  descriptionTextField(10.h),

                  SizedBox(
                    height: 3.h,
                  ),
                  //title
                  Text("Address"),
                  SizedBox(
                    height: 2.h,
                  ),
                  addressTextField(10.h),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      reportButton(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  bool checkIsEmptyTextField(String value) {
    if (value == null || value == "") {
      return true;
    }
    return false;
  }

  GestureDetector reportButton() {
    return GestureDetector(
      onTap: () async {
        if (checkIsEmptyTextField(controller.titleTEController.text) ||
            checkIsEmptyTextField(controller.descriptionTEController.text) ||
            checkIsEmptyTextField(controller.image.value?.path ?? "")) {
          showDialog(
            context: Get.overlayContext!,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Empty fields"),
                content: Text(
                    "You have empty fileds. Please fill these empty fields and try again."),
              );
            },
          );
        }

        if (await controller.reportOnClick() == true) {
          Get.toNamed(Routes.succcesfulyReportedPage);
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 7.h,
        width: 45.w,
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          "Report",
          style: AppTextStyles.infoTextStyleLight,
        ),
      ),
    );
  }

  Widget photoPickerContainer() {
    return Obx(() => controller.image.value?.path == ""
        ? Column(
            children: [
              cameraPickerContainer(),
              SizedBox(
                height: 3.h,
              ),
              libraryPickerContainer(),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Attachments"),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 20.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(controller.image.value!),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 55, 55, 55),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  addMorePhoto(),
                ],
              ),
            ],
          ));
  }

  Widget libraryPickerContainer() {
    return GestureDetector(
      onTap: () {
        controller.onImageButtonPressd(ImageSource.gallery);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: 10.h,
                  width: 24.5.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    color: AppColors.darkBlue,
                  )),
              SizedBox(height: 5.h, child: AppImages.album)
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            alignment: Alignment.centerLeft,
            height: 10.h,
            width: 65.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: AppColors.blue2,
            ),
            child: Text(
              "Select From Library",
              style: AppTextStyles.infoTextStyleLight,
            ),
          )
        ],
      ),
    );
  }

  Widget addMorePhoto() {
    return Center(
        child: GestureDetector(
            onTap: () {
              controller.onImageButtonPressd(ImageSource.camera);
            },
            child: Container(
              height: 20.h,
              width: 30.w,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 212, 212, 212),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ADD\nMORE",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 4.5.h, child: AppImages.camera)
                ],
              ),
            )));
  }

  Widget cameraPickerContainer() {
    return Center(
        child: GestureDetector(
      onTap: () {
        controller.onImageButtonPressd(ImageSource.camera);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: 10.h,
                  width: 24.5.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    color: AppColors.darkBlue,
                  )),
              SizedBox(height: 4.5.h, child: AppImages.camera)
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            alignment: Alignment.centerLeft,
            height: 10.h,
            width: 65.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: AppColors.blue2,
            ),
            child: Text(
              "Take a Photo or Video",
              style: AppTextStyles.infoTextStyleLight,
            ),
          ),
        ],
      ),
    ));
  }

  TextField reportTextField(double height) {
    return TextField(
      // maxLength: 10,
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: height, horizontal: 5.w),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        // hoverColor: Colors.amber,
        //focusColor: Colors.red,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText:
            'AUGV23442', //her birine yeni bir report number generate edilecek
      ),
    );
  }

  TextField titleTextField(double height) {
    return TextField(
      // maxLength: 10,
      controller: controller.titleTEController,
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: height, horizontal: 5.w),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        // hoverColor: Colors.amber,
        //focusColor: Colors.red,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: 'Describe the problem',
      ),
    );
  }

  TextField descriptionTextField(double height) {
    return TextField(
      controller: controller.descriptionTEController,
      textAlign: TextAlign.start,
      //textAlignVertical: TextAlignVertical.bottom,
      minLines: 6,
      maxLines: 10,
      maxLength: 250,
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.symmetric(vertical: height, horizontal: 5.w),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        // hoverColor: Colors.amber,
        //focusColor: Colors.red,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        //hintText: '...',
      ),
    );
  }

  TextField addressTextField(double height) {
    return TextField(
      controller: controller.addressTEController,
      readOnly: true,
      textAlign: TextAlign.start,
      minLines: 4,
      maxLines: 10,
      cursorColor: AppColors.mainColor,
      style: TextStyle(
        color: Colors.grey,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Text title() {
    return Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the",
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 106, 106, 106)),
    );
  }

  Row IncidentType() {
    return Row(
      children: [
        Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 33.0,
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          "heyy",
          style: TextStyle(
              color: Colors.red, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 30.w),
        ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(100, 25)),
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ))),
          onPressed: () {},
          child: Text(
            "Start",
            style: TextStyle(color: AppColors.greyTextColor),
          ),
        )
      ],
    );
  }
}
