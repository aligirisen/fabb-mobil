import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:fabb_mobil/app/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/auth pages/signup_controller.dart';
import '../../routes/app_pages.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   backgroundColor: AppColors.mainColor,
        // ),
        body: Stack(children: [
          SizedBox(
            width: Get.width,
            height: 100.h,
            child: Image(image: AppImages.loginBackground, fit: BoxFit.fill),
          ),
          Container(
              alignment: Alignment.topLeft,
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.only(left: 10.w, top: 15.h),
              //color: Colors.white,
              child: SingleChildScrollView(
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //signupPageTitle(),
                        signupTextFieldFirstName(),
                        signupTextFieldLastName(),
                        signupTextFieldPhone(),
                        signupTextFieldMail(),
                        signupTextFieldPassword(),
                        Container(
                            width: 50.w,
                            margin: EdgeInsets.symmetric(vertical: 2.h),
                            child: Text(
                              AppStrings.agreeText,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            )),
                        signupButton(),
                        alreadyHaveAnAccountText()
                      ],
                    )),
              )),
        ]),
      ),
    );
  }

  GestureDetector alreadyHaveAnAccountText() {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.login);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 25.w),
          child: const Text(
            'Already have an account? Login',
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ));
  }

  bool checkIsEmptyTextField(String value) {
    if (value == null || value == "") {
      return true;
    }
    return false;
  }

  GestureDetector signupButton() {
    return GestureDetector(
      onTap: () async {
        if (checkIsEmptyTextField(controller.firstname.value)) {
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
        if (!await controller.register()) {
          print("Not Found");
        } else {
          await Get.defaultDialog(
              title: "Done!",
              titleStyle: const TextStyle(color: Colors.white),
              backgroundColor: const Color.fromARGB(255, 41, 41, 41),
              content: const Text('Succesfully created an account.',
                  style: TextStyle(color: Colors.white)));
        }
        Get.toNamed(Routes.login);
      },
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 2.h),
          height: 8.h,
          width: 70.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 66, 66, 66).withOpacity(0.6),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color.fromARGB(255, 157, 157, 157),
                width: 1,
              ),
              color: const Color.fromARGB(255, 255, 255, 255)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "SIGN UP",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 21, 54, 70)),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Icon(Icons.arrow_right)
            ],
          )),
    );
  }

  Container signupTextFieldFirstName() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 3.w, bottom: 0.3.h),
      height: 7.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        // border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))
      ),
      child: TextFormField(
        onSaved: (value) {
          controller.firstname.value = value ?? "";
        },
        validator: (value) {
          return controller.validateFullName(value!);
        },
        onChanged: (value) {
          controller.firstname.value = value;
        },
        decoration: const InputDecoration(
            // border: InputBorder.none,
            hintText: 'First Name',
            hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }

  Container signupTextFieldLastName() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 3.w, bottom: 0.3.h),
      height: 7.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        // border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))
      ),
      child: TextFormField(
        onSaved: (value) {
          controller.lastname.value = value ?? "";
        },
        validator: (value) {
          return controller.validateFullName(value!);
        },
        onChanged: (value) {
          controller.lastname.value = value;
        },
        decoration: const InputDecoration(
            hintText: 'Last Name', hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }

  Container signupTextFieldPhone() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 3.w, bottom: 0.3.h),
      height: 7.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        // border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))
      ),
      child: TextFormField(
        onSaved: (value) {
          controller.phonenumber.value = value!;
        },
        validator: (value) {
          return controller.validatePhoneNumber(value!);
        },
        onChanged: (value) {
          controller.phonenumber.value = value;
        },
        decoration: const InputDecoration(
            hintText: 'Phone Number', hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }

  Container signupTextFieldMail() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 3.w, bottom: 0.3.h),
      height: 7.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        // border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))
      ),
      child: TextFormField(
        onSaved: (value) {
          controller.email.value = value!;
        },
        validator: (value) {
          return controller.validateEmail(value!);
        },
        onChanged: (value) {
          controller.email.value = value;
        },
        decoration: const InputDecoration(
            hintText: 'E-mail', hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }

  Container signupTextFieldPassword() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 3.w, bottom: 0.3.h),
      height: 7.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        // border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))
      ),
      child: TextFormField(
        onSaved: (value) {
          controller.password.value = value!;
        },
        validator: (value) {
          return controller.validatePassword(value!);
        },
        onChanged: (value) {
          controller.password.value = value;
        },
        obscureText: controller.isPasswordHidden.value,
        decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: const TextStyle(fontSize: 13),
            suffix: InkWell(
              child: Icon(
                controller.isPasswordHidden.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.grey,
                size: 2.h,
              ),
              onTap: () {
                controller.isPasswordHidden.value =
                    !controller.isPasswordHidden.value;
              },
            )),
      ),
    );
  }

  Text signupPageTitle() {
    return const Text('SIGN UP',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300));
  }
}
