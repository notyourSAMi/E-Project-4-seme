import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/app_rounded_images.dart';
import '../../texts/app_brand_title_text_with_verfied_icon.dart';
import '../../texts/product_title_text.dart';

class AppCartItem extends StatelessWidget {
  const AppCartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);

    return Row(
      children: [
        AppRoundedImage(
          imageUrl: AppImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(AppSizes.sm),
          backgroundColor: darkMode ? AppColors.darkerGrey : AppColors.light,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems,),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: AppProductTitleText(title: 'Black Sports shoes', maxLines: 1,)),
              Text.rich(TextSpan(
                  children:[
                    TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'UK 08 ', style: Theme.of(context).textTheme.bodyLarge),
                  ]
              ))
            ],
          ),
        )
      ],
    );
  }
}