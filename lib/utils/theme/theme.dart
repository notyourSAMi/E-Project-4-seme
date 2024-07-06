import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/appbar_themes.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/text_field_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/text_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/chip_theme.dart';

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    appBarTheme: AppbarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: BottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TextFieldTheme.lightTextFieldTheme,
    elevatedButtonTheme: AppButtonTheme.lightElevatedButtonTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.black,
      textTheme: AppTextTheme.darkTextTheme,
      chipTheme: AppChipTheme.darkChipTheme,
      appBarTheme: AppbarTheme.darkAppBarTheme,
      checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: BottomSheetTheme.darkBottomSheetTheme,
      outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: TextFieldTheme.darkTextFieldTheme,
      elevatedButtonTheme: AppButtonTheme.darkElevatedButtonTheme
  );

}