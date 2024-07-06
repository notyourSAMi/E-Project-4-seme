import 'package:e_commerce_app/pages/cart/cart.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class AppCartCounterIcon extends StatelessWidget {
  const AppCartCounterIcon({
    super.key, required this.onPressed,this.iconColor = AppColors.black, this.counterBgColor, this.counterTextColor,
  });
  final VoidCallback onPressed;
  final Color? iconColor, counterBgColor, counterTextColor;
  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: const Icon(Iconsax.shopping_bag),color: iconColor,),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: counterBgColor ?? (darkMode ? AppColors.white : AppColors.black),
                borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Text("2",style: Theme.of(context).textTheme.labelLarge!.apply(color: AppHelperFunction.isDarkMode(context) ? AppColors.black : AppColors.white, fontSizeFactor: 0.8),),
            ),
          ),
        )
      ],
    );
  }
}
