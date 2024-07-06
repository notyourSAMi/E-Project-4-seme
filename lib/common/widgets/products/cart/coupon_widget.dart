import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/AppRoundedContainer.dart';

class AppCouponCode extends StatelessWidget {
  const AppCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);

    return AppRoundedContainer(
      showBorder: true,
      backgroundColor: darkMode ? AppColors.dark : AppColors.white,
      padding: const EdgeInsets.only(
          top: AppSizes.sm,
          bottom: AppSizes.sm,
          right: AppSizes.sm,
          left: AppSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {}, style: ElevatedButton.styleFrom(
                  foregroundColor: darkMode ? AppColors.white.withOpacity(0.5) : AppColors.dark.withOpacity(0.5),
                  backgroundColor: AppColors.grey.withOpacity(0.2),
                  side: BorderSide(color: AppColors.grey.withOpacity(0.1))
              ), child: const Text('Apply'),
              ))
        ],
      ),
    );
  }
}
