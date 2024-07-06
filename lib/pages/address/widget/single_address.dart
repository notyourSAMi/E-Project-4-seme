import 'package:e_commerce_app/common/widgets/custom_shapes/containers/AppRoundedContainer.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppSingleAddress extends StatelessWidget {
  const AppSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return AppRoundedContainer(
      padding: const EdgeInsets.all(AppSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? AppColors.primary.withOpacity(0.5) : Colors.transparent ,
      borderColor: selectedAddress ? Colors.transparent : darkMode ? AppColors.darkerGrey : AppColors.grey,
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? darkMode ? AppColors.light : AppColors.dark.withOpacity(0.6) : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.sm / 2 ,),
              const Text('(+123) 456 7890', maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: AppSizes.sm / 2 ,),
              const Text('82356 Timmy Coves, South Liana, Maine, 87665, USA')

            ],
          )
        ],
      ),
    );
  }
}
