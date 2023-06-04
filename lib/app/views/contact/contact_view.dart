import 'package:fabb_mobil/app/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/navigation_drawer.dart';
import '../../theme/app_colors.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: AppBar(
        toolbarHeight: 9.h,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        title: Text("Contact Us"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            AppImages.contact,
            Icon(
              Icons.email_outlined,
              size: 6.h,
              weight: 5,
              color: AppColors.darkBlue,
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: _launchEmailApp,
              child: Text(
                "fabbsoft@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Icon(
              Icons.phone_android_outlined,
              size: 6.h,
              weight: 5,
              color: AppColors.darkBlue,
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: _launchPhoneApp,
              child: Text("+90 5384869794",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkBlue,
                  )),
            )
          ]),
    );
  }

  void _launchEmailApp() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'fabbsoft@gmail.com',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'E-posta uygulaması bulunamadı';
    }
  }

  void _launchPhoneApp() async {
    final phoneLaunchUri = Uri(scheme: 'tel', path: '+90 5384869794');

    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    } else {
      throw 'Telefon uygulaması bulunamadı';
    }
  }
}
