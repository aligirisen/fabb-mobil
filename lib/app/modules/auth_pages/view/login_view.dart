import 'package:fabb_mobil/app/modules/auth_pages/controller/auth_controller.dart';
import 'package:fabb_mobil/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
          // Container(
          //   height: Get.height,
          //   width: Get.width,
          //   child: Image.asset('assets/images/login_background.png'),
          // ),
          Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 60),
              margin: EdgeInsets.only(top: 50),
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
                            LoginButton(),
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
          child: Text(
            'or Create an account',
            style:
                TextStyle(fontSize: 13, color: Color.fromARGB(255, 81, 81, 81)),
          ),
        ));
  }

  GestureDetector LoginButton() {
    return GestureDetector(
      onTap: () {
        if (controller.checkLogin()) {
          Get.toNamed('/signup');
        } else {
          Get.defaultDialog(
              title: "Try again",
              titleStyle: TextStyle(color: Colors.white),
              backgroundColor: Color.fromARGB(255, 41, 41, 41),
              content: Text('Invalid email or password.',
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
            color: Color.fromARGB(255, 54, 54, 54)),
        child: Text(
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
          border: Border.all(color: Color.fromARGB(255, 106, 106, 106))),
      child: TextFormField(
        controller: controller.passwordController,
        onSaved: (value) {
          controller.password = value!;
        },
        validator: (value) {
          return controller.validatePassword(value!);
        },
        obscureText: controller.isPasswordHidden.value,
        decoration: InputDecoration(
            icon: Icon(Icons.lock),
            border: UnderlineInputBorder(),
            hintText: 'Password',
            hintStyle: TextStyle(fontSize: 13),
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
          border: Border.all(color: Color.fromARGB(255, 106, 106, 106))),
      child: TextFormField(
        controller: controller.emailController,
        onSaved: (value) {
          controller.email = value!;
        },
        validator: (value) {
          return controller.validateEmail(value!);
        },
        onChanged: (value) {},
        decoration: const InputDecoration(
            icon: Icon(Icons.person),
            border: UnderlineInputBorder(),
            hintText: 'E-mail',
            hintStyle: TextStyle(fontSize: 13)),
      ),
    );
  }

  Text appTitle() {
    return Text('FABB',
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700));
  }
}
