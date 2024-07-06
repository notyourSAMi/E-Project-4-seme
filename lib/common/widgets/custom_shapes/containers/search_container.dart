import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class AppSearchTextField extends StatelessWidget {
  const AppSearchTextField({
    super.key,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
    this.controller,
    this.hintText,
    this.onChanged,
  });

  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: AppDeviceUtility.getScreenWidth(context),
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                ? AppColors.dark
                : AppColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: AppColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: dark ? AppColors.darkerGrey : AppColors.grey,
              ),
              const SizedBox(
                width: AppSizes.spaceBtwItems,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    isDense: true,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
