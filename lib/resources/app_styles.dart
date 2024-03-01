import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsup/resources/app_colors.dart';

import 'app_fonts.dart';

class AppStyles {
  static TextStyle? interRegular({double? fontSize = 16, Color? color = AppColors.textColor, TextDecoration? decoration}) {
    return TextStyle(fontSize: fontSize!.sp, color: color, fontFamily: AppFonts.interRegular, decoration: decoration);
  }

  static TextStyle? interMediumStyle({double? fontSize = 16, Color? color = AppColors.textColor, TextDecoration? decoration}) {
    return TextStyle(fontSize: fontSize!.sp, color: color, fontFamily: AppFonts.interMedium, decoration: decoration);
  }

  static TextStyle? interSemiBoldStyle({double? fontSize = 15, Color? color = AppColors.textColor, TextDecoration? decoration, TextOverflow? textOverflow}) {
    return TextStyle(fontSize: fontSize!.sp, color: color, fontFamily: AppFonts.interSemiBold, overflow: textOverflow, decoration: decoration);
  }

  static TextStyle? interBoldStyle({double? fontSize = 15, Color? color = AppColors.textColor, TextDecoration? decoration}) {
    return TextStyle(fontSize: fontSize!.sp, color: color, fontFamily: AppFonts.interBold, decoration: decoration);
  }
}
