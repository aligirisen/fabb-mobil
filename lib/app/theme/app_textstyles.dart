import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle infoTitleStyleLight = TextStyle(
      color: AppColors.infoTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w500);

  static TextStyle infoTextStyleLight = TextStyle(
    color: AppColors.infoTextColor,
    fontSize: 16,
  );

  static TextStyle infoTitleStyleDark = TextStyle(
      color: AppColors.darkBlue, fontSize: 18, fontWeight: FontWeight.w700);

  static TextStyle infoTextStyleDark = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 16,
  );
}
