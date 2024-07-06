import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/app_circular_icon.dart';

class AppProductQuantityWithAddRemoveButton extends StatelessWidget {
  const AppProductQuantityWithAddRemoveButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: AppSizes.md,
          color: darkMode ? AppColors.white : AppColors.black,
          backgroundColor: darkMode ? AppColors.darkerGrey : AppColors.light,

        ),
        const SizedBox(width: AppSizes.spaceBtwItems,),
        Text('2', style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: AppSizes.spaceBtwItems,),
        const AppCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: AppSizes.md,
          color: AppColors.white,
          backgroundColor: AppColors.primary,

        ),
      ],
    );
  }
}
