
import 'package:e_commerce_app/common/styles/shadows.dart';
import 'package:e_commerce_app/common/widgets/images/app_rounded_images.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_price_tag.dart';
import 'package:e_commerce_app/pages/product_details/product_detail.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../custom_shapes/containers/AppRoundedContainer.dart';
import '../../icons/app_circular_icon.dart';
import '../../texts/app_brand_title_text_with_verfied_icon.dart';
import '../../texts/product_title_text.dart';

class AppProductCardVertical extends StatelessWidget {
  const AppProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [AppShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
            color: darkMode ? AppColors.darkerGrey : AppColors.white),
        child: Column(
          children: [
            AppRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: darkMode ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  AppRoundedImage(
                    imageUrl: AppImages.productImage1,
                    applyImageRadius: true,
                    backgroundColor: darkMode ? AppColors.black : AppColors.light,
                  ),
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
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
          const  Padding(
              padding:  EdgeInsets.only(left: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   AppProductTitleText(
                    title: 'Faisal Masjid',
                    smallSize: true,
                  ),
                   SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  AppBrandTitleWithVerifiedIcon(title: 'Islamabad',),
                ],
              ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Padding(
                  padding:  EdgeInsets.only(left: AppSizes.sm),
                  child:  AppProdutctPriceText(price: '35.0',),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: AppColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSizes.cardRadiusMd),
                        bottomRight: Radius.circular(AppSizes.cardRadiusMd),
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
            )
          ],
        ),
      ),
    );
  }
}



