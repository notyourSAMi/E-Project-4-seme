import 'package:e_commerce_app/common/widgets/custom_shapes/containers/AppRoundedContainer.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppOrderListItems extends StatelessWidget {
  const AppOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return ListView.separated(
      itemCount: 3,
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.spaceBtwItems,),
      itemBuilder: (_, index)=> AppRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(AppSizes.md),
        backgroundColor: darkMode ? AppColors.dark : AppColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: AppSizes.spaceBtwItems / 2,),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: AppColors.primary, fontWeightDelta: 1),
                      ),
                      Text('24 May 2024', style: Theme.of(context).textTheme.headlineSmall,)
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34,size: AppSizes.iconSm,))
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwItems,),
      
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: AppSizes.spaceBtwItems / 2,),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium,),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: AppSizes.spaceBtwItems / 2,),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium,),
                            Text('03 Feb 2025', style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
