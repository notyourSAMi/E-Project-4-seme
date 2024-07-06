import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget{
  const AppTabBar({
    super.key, required this.tabs,
  });
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Material(
      child: TabBar(
          isScrollable: true,
          indicatorColor: AppColors.primary,
          unselectedLabelColor: AppColors.darkGrey,
          labelColor: darkMode ? AppColors.white : AppColors.primary,
          tabs: tabs),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppDeviceUtility.getAppBarHeight());
}
