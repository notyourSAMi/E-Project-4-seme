import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/app_rounded_images.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_horziontal.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Sports shirts'), showBackArrow: true ,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            const AppRoundedImage(imageUrl: AppImages.banner3, width: double.infinity, applyImageRadius: true,),
            const SizedBox(height: AppSizes.spaceBtwSections,),

            Column(
              children: [
                AppSectionHeading(title: 'Sports shirts', onPressed: () {}, showActionButton: true,),
                const SizedBox(height: AppSizes.spaceBtwItems / 2,),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: AppSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const AppProductCardHorizontal()
                  ),
                ),
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}
