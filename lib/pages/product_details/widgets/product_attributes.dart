import 'package:e_commerce_app/common/widgets/custom_shapes/containers/AppRoundedContainer.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Column(
      children: [
        AppRoundedContainer(
          padding: const EdgeInsets.all(AppSizes.md),
            backgroundColor: darkMode ? AppColors.darkerGrey : AppColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const AppSectionHeading(title: 'Variation',showActionButton: false,),
                  const SizedBox(width: AppSizes.spaceBtwItems,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const AppProductTitleText(title: 'Price : ', smallSize: true,),

                          Text('\$25',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          const SizedBox(width: AppSizes.spaceBtwItems,),
                          const AppProductTitleText(title: '\$20')

                        ],
                      ),
                      Row(
                        children: [
                          const AppProductTitleText(title: 'Stock : ', smallSize: true,),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      )
                    ],
                  ),

                ],
              ),
              const AppProductTitleText(title: 'This is the Description of the Product and it can go upto max 4 lines.',
              smallSize: true, maxLines: 4,)
            ],
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(title: 'Colors'),
            const SizedBox(height: AppSizes.spaceBtwItems / 2,),
           Wrap(
             spacing: 8,
             children: [
               AppChoiceChip(text: 'Green', selected: true, onSelected: (value) {},),
               AppChoiceChip(text: 'Blue', selected: false,onSelected: (value) {}),
               AppChoiceChip(text: 'Yellow', selected: false,onSelected: (value) {}),
             ],
           )

          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const   AppSectionHeading(title: 'Colors'),
           const SizedBox(height: AppSizes.spaceBtwItems / 2,),
           Wrap(
             spacing: 8,
             children: [
               AppChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {},),
               AppChoiceChip(text: 'Eu 36', selected: false,onSelected: (value) {}),
               AppChoiceChip(text: 'Eu 38', selected: false,onSelected: (value) {}),
             ],
           )

          ],
        )

      ],
    );
  }
}

