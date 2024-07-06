
import 'package:e_commerce_app/pages/all_products/all_products.dart';
import 'package:e_commerce_app/pages/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/pages/home/widgets/home_categories.dart';
import 'package:e_commerce_app/pages/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           const AppPrimaryHeaderContainer( // Use the merged AppPrimaryHeaderContainer
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  AppSearchTextField(hintText: 'Search in Store', icon: Iconsax.search_normal),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        AppSectionHeading(title: 'Popular Cities', showActionButton: false, textColor: AppColors.white),
                        SizedBox(height: AppSizes.spaceBtwItems),
                        AppHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding( // Content below the header
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppPromoSilder(banners: [AppImages.promoBanner1, AppImages.promoBanner2, AppImages.promoBanner3]),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  AppSectionHeading(
                    title: 'Popular Places',
                    showActionButton: true,
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  AppGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const AppProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

