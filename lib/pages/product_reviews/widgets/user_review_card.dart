import 'package:e_commerce_app/common/widgets/custom_shapes/containers/AppRoundedContainer.dart';
import 'package:e_commerce_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
               const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.userProfileImage1),
                ),
                const SizedBox(width: AppSizes.spaceBtwItems,),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: AppSizes.spaceBtwItems,),

        Row(
          children: [
            const AppRatingBarIndicator(rating: 4),
            const SizedBox(width: AppSizes.spaceBtwItems,),
            Text('23 May, 2024', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems,),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
          lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems,),
        AppRoundedContainer(
          backgroundColor: darkMode ? AppColors.darkerGrey : AppColors.grey,
          child: Padding(padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("T's Store", style: Theme.of(context).textTheme.titleMedium,),
                  Text('23 May, 2024', style: Theme.of(context).textTheme.bodyMedium,)
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwItems,),
              const ReadMoreText(
                'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: ' show less',
                trimCollapsedText: ' show more',
                moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
                lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
            ],
          ),),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections,),

      ],
    );
  }
}
