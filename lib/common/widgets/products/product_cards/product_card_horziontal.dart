import 'package:e_commerce_app/common/widgets/custom_shapes/containers/AppRoundedContainer.dart';
import 'package:e_commerce_app/common/widgets/images/app_rounded_images.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_price_tag.dart';
import 'package:e_commerce_app/common/widgets/texts/app_brand_title_text_with_verfied_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/app_circular_icon.dart';

class AppProductCardHorizontal extends StatelessWidget {
  const AppProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: darkMode ? AppColors.darkerGrey : AppColors.softgrey),
      child: Row(
        children: [
          AppRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(AppSizes.sm),
            backgroundColor: darkMode ? AppColors.dark : AppColors.light,
            child: Stack(
              children: [
                const SizedBox(
                    width: 120,
                    height: 120,
                    child: AppRoundedImage(
                      imageUrl: AppImages.productImage1,
                      applyImageRadius: true,
                    )),
                Positioned(
                  top: 12,
                  child: AppRoundedContainer(
                    radius: AppSizes.sm,
                    backgroundColor: AppColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm, vertical: AppSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: AppColors.black),
                    ),
                  ),
                ),
                const Positioned(
                    top: 0,
                    right: 0,
                    child: AppCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child:
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.sm, left: AppSizes.sm),
                  child: Column(
                    children: [
                     const Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                          AppProductTitleText(
                            title: 'Green Nike Half Sleeves Shirt',
                            smallSize: true,
                          ),
                          SizedBox(
                            height: AppSizes.spaceBtwItems / 2,
                          ),
                          AppBrandTitleWithVerifiedIcon(title: 'Nike')
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(child: AppProdutctPriceText(price: '256')),
                          Container(
                            decoration: const BoxDecoration(
                                color: AppColors.dark,
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(AppSizes.cardRadiusMd),
                                  bottomRight:
                                      Radius.circular(AppSizes.cardRadiusMd),
                                )),
                            child: const SizedBox(
                                height: AppSizes.iconLg * 1.2,
                                width: AppSizes.iconLg * 1.2,
                                child: Center(
                                  child: Icon(
                                    Iconsax.add,
                                    color: AppColors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

          )
        ],
      ),
    );
  }
}
