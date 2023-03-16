import 'package:fabb_mobil/app/controllers/auth_controller.dart';
import 'package:fabb_mobil/app/modules/auth_pages/controller/login_controller.dart';
import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/app_images.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
        ),
        body: Stack(children: [
          Container(
            width: Get.width,
            height: 100.h,
            child: Image(image: AppImages.loginBackground, fit: BoxFit.fill),
          ),
          Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 60),
              margin: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                  child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: controller.loginFormKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            appTitle(),
                            emailTextFormField(),
                            Obx(
                              () => passwordTextFormField(),
                            ),
                            loginButton(),
                            orCreateAccountText()
                          ])))),
        ]),
      ),
    );
  }

  GestureDetector orCreateAccountText() {
    return GestureDetector(
        onTap: () {
          Get.toNamed('/signup');
        },
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: const Text(
            'or Create an account',
            style:
                TextStyle(fontSize: 13, color: Color.fromARGB(255, 81, 81, 81)),
          ),
        ));
  }

  GestureDetector loginButton() {
    return GestureDetector(
      onTap: () {
        print(
            "password : ${controller.password.value} \nemail : ${controller.email.value}");
        if (controller.login(
                controller.email.value, controller.password.value) ==
            true) {
          Get.toNamed('/signup');
        } else {
          Get.defaultDialog(
              title: "Try again",
              titleStyle: const TextStyle(color: Colors.white),
              backgroundColor: const Color.fromARGB(255, 41, 41, 41),
              content: const Text('Invalid email or password.',
                  style: TextStyle(color: Colors.white)));
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 4.h),
        height: 7.h,
        width: 70.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(255, 54, 54, 54)),
        child: const Text(
          "LOGIN NOW",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Container passwordTextFormField() {
    return Container(
      margin: EdgeInsets.only(top: 3.h),
      padding: EdgeInsets.all(3.h),
      height: 10.h,
      width: 90.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
          border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))),
      child: TextFormField(
        controller: controller.passwordController,
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
            icon: const Icon(Icons.lock),
            border: const UnderlineInputBorder(),
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

  Container emailTextFormField() {
    return Container(
      margin: EdgeInsets.only(top: 3.h),
      padding: EdgeInsets.all(3.h),
      height: 10.h,
      width: 90.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
          border: Border.all(color: const Color.fromARGB(255, 106, 106, 106))),
      child: TextFormField(
        controller: controller.emailController,
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
            icon: Icon(Icons.person),
            border: UnderlineInputBorder(),
            hintText: 'E-mail',
            hintStyle: TextStyle(fontSize: 13)),
      ),
    );
  }

  Text appTitle() {
    return const Text('FABB',
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700));
  }
}
