import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppButtonTheme {
  AppButtonTheme._();

  static final ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: AppColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 20),
      textStyle: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
    )
  );
  static final ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primary,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: const BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(vertical: 20),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      )
  );

}