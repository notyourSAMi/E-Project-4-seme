import 'package:e_commerce_app/common/widgets/custom_shapes/containers/AppRoundedContainer.dart';
import 'package:e_commerce_app/common/widgets/images/app_circular_images.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_price_tag.dart';
import 'package:e_commerce_app/common/widgets/texts/app_brand_title_text_with_verfied_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppProductMetaData extends StatelessWidget {
  const AppProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppRoundedContainer(
              radius: AppSizes.sm,
              backgroundColor: AppColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black),),
            ),
             const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text("\$250", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            const AppProdutctPriceText(price: '175', isLarge: true,)
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 1.5,
        ),
        const AppProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const AppProductTitleText(title: 'Status'),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
          Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            AppCirularImage(image: AppImages.nikeLogo,width: 32,height: 32, overlayColor: darkMode ? AppColors.white : AppColors.black,),
            const AppBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium,),
          ],
        )

      ],
    );
  }
}
