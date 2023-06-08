import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/auth pages/login_controller.dart';
import '../../general_app_datas/general_app_datas.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_images.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  // final LoginController controller = Get.find<LoginController>();
  // final LoginController controller = Get.put(
  //   LoginController(),
  // );
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Uygulamadan Çık'),
            content: Text('Uygulamadan çıkmak istiyor musunuz?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Evet'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Hayır'),
              ),
            ],
          ),
        ).then((value) {
          if (value == true) {
            // Uygulamadan çıkma işlemi
            SystemNavigator.pop();
          }
        });

        // Uygulamadan çıkma işlemini engellemek için false döndürün
        return false;
      },
      child: GestureDetector(
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
                height: Get.height,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                margin: EdgeInsets.only(top: 23.h),
                child: SingleChildScrollView(
                    child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // key: controller.loginFormKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //appTitle(),
                              emailTextFormField(),
                              Obx(
                                () => passwordTextFormField(),
                              ),
                              // forgotPassword(),
                              loginButton(),
                              orCreateAccountText()
                            ])))),
            continueAsGuest(),
            logo()
          ]),
        ),
      ),
    );
  }

  Align logo() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h, left: 2.h),
        height: 8.h,
        child: Image(image: AppImages.logo),
      ),
    );
  }

  GestureDetector continueAsGuest() {
    return GestureDetector(
      onTap: () {
        //   MapViewController.to.initialize();
        // ListViewController.to.initialize();
        Get.toNamed(Routes.home);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 18.w, bottom: 20.h),
        child: const Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "Continue as\nGuest",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Row forgotPassword() {
    return Row(
      children: [
        SizedBox(
          width: 35.w,
        ),
        GestureDetector(
            onTap: () {},
            child: const Text(
              "Forgot password?",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )),
      ],
    );
  }

  GestureDetector orCreateAccountText() {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.signup);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 45.w),
          child: const Text(
            'or Create an account',
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ));
  }

  GestureDetector loginButton() {
    return GestureDetector(
      onTap: () async {
        if (await controller.loginService(
            controller.email.value, controller.password.value)) {
          // User user = controller.getUserList.firstWhere((user) => user.email == 'x@gmail.com', orElse: () => null);
          //  GeneralAppDatas.loggedInUser.value = user;

          Get.toNamed(Routes.home);
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
          margin: EdgeInsets.only(top: 10.h),
          height: 8.h,
          width: 90.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 66, 66, 66).withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              // border: Border.all(
              //   color:Color.fromARGB(255, 157, 157, 157),
              //   width: 1,
              // ),
              color: const Color.fromARGB(255, 255, 255, 255)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "LOGIN NOW",
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

  SizedBox passwordTextFormField() {
    return SizedBox(
      height: 10.h,
      width: 60.w,
      child: TextFormField(
        controller: controller.passwordController,
        onSaved: (value) {
          controller.password.value = value!;
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

  SizedBox emailTextFormField() {
    return SizedBox(
      height: 10.h,
      width: 60.w,
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
