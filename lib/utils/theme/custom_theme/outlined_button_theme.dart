import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: AppColors.primary),
      textStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    )
  );
  static OutlinedButtonThemeData darkOutlinedButtonTheme = OutlinedButtonThemeData(    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: AppColors.primary),
      textStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
  ));

}