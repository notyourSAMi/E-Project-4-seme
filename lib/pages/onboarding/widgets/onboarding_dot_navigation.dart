import 'package:e_commerce_app/backend/Authentication%20Backend/onboarding/onboarding_controller.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = AppHelperFunction.isDarkMode(context);
    return Positioned(
        bottom: AppDeviceUtility.getBottomNavigationBarHeight() + 25,
        left: AppSizes.defaultSpace,
        child: SmoothPageIndicator(
            effect: ExpandingDotsEffect(
                activeDotColor: dark ? AppColors.light: AppColors.dark, dotHeight: 6),
            controller:  controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 3));
  }
}