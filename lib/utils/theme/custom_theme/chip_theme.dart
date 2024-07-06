import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: AppColors.black),
    selectedColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.black
  );
  static ChipThemeData darkChipTheme = const ChipThemeData(
      disabledColor: Colors.grey,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      checkmarkColor: Colors.white
  );

}