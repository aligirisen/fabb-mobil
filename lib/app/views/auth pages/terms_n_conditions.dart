import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';

class TermsnConditionsView extends StatelessWidget {
  const TermsnConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          color: AppColors.containerBackground,
          padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terms and Conditions\n",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Introduction\nThese Terms and Conditions govern your registration and use of the web panel ('Web Panel') provided by our organization. By completing the registration process and accessing the Web Panel, you agree to be bound by these Terms and Conditions. If you do not agree with any part of these Terms and Conditions, you may not register or use the Web Panel.\nRegistration\n2.1 Eligibility: To register for the Web Panel, you must be at least 18 years old and have the authority to enter into a binding agreement on behalf of the organization you represent.\n2.2 Accurate Information: You agree to provide accurate, current, and complete information during the registration process. You are solely responsible for maintaining the confidentiality of your registration details.\nUser Responsibiliti\n3.1 Authorized Use:\nYou agree to use the Web Panel solely for lawful purposes and in compliance with all applicable laws and regulations\nYou will not engage in any activity that may disrupt or interfere with the proper functioning of the Web Panel or its associated services.\nYou will not attempt to gain unauthorized access to the Web Panel or any related systems or networks.\nIntellectual Property\n4.1 Ownership: The Web Panel and all related content, including but not limited to text, graphics, logos, images, and software, are the property of our organization or its licensors and are protected by intellectual property laws.\n4.2 License: By registering for the Web Panel, we grant you a limited, non-exclusive, non-transferable license to use the Web Panel for the purposes intended.\nPrivacy Policy\nInformation Collection and Use\n1.1 Personal Information: During the registration process, we may collect personal information such as your name, email address, and contact details. This information will be used solely for the purpose of providing and maintaining the Web Panel and communicating with you regarding your account.\n1.2 Log Data: We may also collect log data, including your IP address, browser type, and operating system, to analyze trends, administer the Web Panel, and gather demographic information.\nData Security\n2.1 We take appropriate security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction.\n2.2 We will not sell, trade, or rent your personal information to third parties unless we have your explicit consent or are required by law to do so.\nCookies\n3.1 The Web Panel may use cookies to enhance your user experience. These cookies may collect information about your usage patterns and preferences.\nChanges to the Privacy Policy\n4.1 We reserve the right to modify or update this Privacy Policy at any time. Any changes will be effective immediately upon posting the revised Privacy Policy on the Web Panel.\nBy registering for the Web Panel, you acknowledge that you have read and understood the Terms and Conditions and Privacy Policy, and you agree to abide by them.",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(
                height: 3.h,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(100, 25)),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ))),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "OK",
                  style: TextStyle(color: AppColors.greyTextColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
