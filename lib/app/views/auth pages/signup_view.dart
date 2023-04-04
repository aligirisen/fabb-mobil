import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:fabb_mobil/app/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/auth pages/signup_controller.dart';

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
          Get.toNamed('/login');
        },
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 25.w),
          child: const Text(
            'Already have an account? Login',
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ));
  }

  GestureDetector signupButton() {
    return GestureDetector(
      onTap: () async {
        if (!await controller.register()) {
          print("Not Found");
        } else {
          Get.defaultDialog(
              title: "Done!",
              titleStyle: const TextStyle(color: Colors.white),
              backgroundColor: const Color.fromARGB(255, 41, 41, 41),
              content: const Text('Succesfully created an account.',
                  style: TextStyle(color: Colors.white)));
        }
        //Get.toNamed('/login');
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
      padding: EdgeInsets.only(left: 5.w, bottom: 0.3.h),
      height: 5.h,
      width: 50.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
          border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))),
      child: TextFormField(
        onSaved: (value) {
          controller.firstname.value = value!;
        },
        onChanged: (value) {
          controller.firstname.value = value;
        },
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'First Name',
            hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }

  Container signupTextFieldLastName() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 5.w, bottom: 0.3.h),
      height: 5.h,
      width: 50.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
          border: Border.all(color: const Color.fromARGB(255, 156, 156, 156))),
      child: TextFormField(
        onSaved: (value) {
          controller.lastname.value = value!;
        },
        onChanged: (value) {
          controller.lastname.value = value;
        },
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Last Name',
            hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }

  Container signupTextFieldPhone() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 5.w, bottom: 0.3.h),
      height: 5.h,
      width: 50.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
          border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))),
      child: TextFormField(
        onSaved: (value) {
          controller.phonenumber.value = value!;
        },
        onChanged: (value) {
          controller.phonenumber.value = value;
        },
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Phone Number',
            hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }

  Container signupTextFieldMail() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 5.w, bottom: 0.3.h),
      height: 5.h,
      width: 50.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
          border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))),
      child: TextFormField(
        onSaved: (value) {
          controller.email.value = value!;
        },
        onChanged: (value) {
          controller.email.value = value;
        },
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'E-mail',
            hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }

  Container signupTextFieldPassword() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 5.w, bottom: 0.3.h),
      height: 5.h,
      width: 50.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
          border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))),
      child: TextFormField(
        onSaved: (value) {
          controller.password.value = value!;
        },
        onChanged: (value) {
          controller.password.value = value;
        },
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Password',
            hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }

  Text signupPageTitle() {
    return const Text('SIGN UP',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300));
  }
}


// Text(
//                     controller.displayText.value,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: controller.passwordStrength.value <= 1 / 4
//                           ? Colors.red
//                           : controller.passwordStrength.value == 2 / 4
//                               ? Colors.amber
//                               : controller.passwordStrength.value == 3 / 4
//                                   ? Colors.deepPurpleAccent
//                                   : Colors.green,
//                     ),
//                   ),