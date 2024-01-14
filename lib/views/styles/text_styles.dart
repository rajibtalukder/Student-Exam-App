import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:lexam/constants/constant.dart';

class AppTextStyles {
   AppTextStyles._();

   static TextStyle get navBarActive => TextStyle(
      color: AppColors.blue,
      fontSize: 15.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w600,
   );

   static TextStyle get navBarInactive =>
       navBarActive.copyWith(color: AppColors.black);

   static TextStyle get searchWidget => TextStyle(
      color: AppColors.blueAccent,
      fontSize: 13.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w600,
   );

   static TextStyle get widgetTitle => TextStyle(
      color: AppColors.black,
      fontSize: 16.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w600,
   );

   static TextStyle get buttonText => TextStyle(
      color: AppColors.white,
      fontSize: 16.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w400,
   );

   static TextStyle get widgetOption => TextStyle(
      color: AppColors.blue,
      fontSize: 11.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w600,
   );

   static TextStyle get sliderLabels => TextStyle(
      color: AppColors.blueAccent,
      fontSize: 11.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w400,
   );

   static TextStyle get screenTitle => TextStyle(
      color: AppColors.black,
      fontSize: 20.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w600,
   );
   static TextStyle get title => TextStyle(
      color: AppColors.blue,
      fontSize: 14.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w600,
   );

   static TextStyle get body => TextStyle(
      color: AppColors.gray,
      fontSize: 11.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w400,
   );


   static TextStyle get examOption => TextStyle(
      color: AppColors.black,
      fontSize: 12.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w400,
   );
   static TextStyle get number => TextStyle(
      color: AppColors.blue,
      fontSize: 16.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w400,
   );

   static TextStyle get textFieldStyle => TextStyle(
      color: AppColors.black,
      fontSize: 14.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w400,
   );

   static TextStyle get hint => TextStyle(
      color: AppColors.lightGray,
      fontSize: 13.sp,
      fontFamily: AppFonts.kalpurush,
      fontWeight: FontWeight.w400,
   );

}
