import 'package:e_commerce_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/pages/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:e_commerce_app/pages/product_details/widgets/product_attributes.dart';
import 'package:e_commerce_app/pages/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_commerce_app/pages/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_app/pages/product_details/widgets/rating_share_widget.dart';
import 'package:e_commerce_app/pages/product_reviews/product_reviews.dart';
import 'package:e_commerce_app/pages/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:e_commerce_app/pages/product_reviews/widgets/user_review_card.dart';

import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCartWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                  right: AppSizes.defaultSpace,
                  left: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppRatingAndShare(),
                  // const AppProductMetaData(),
                  // const ProductAttributes(),
                  // const SizedBox(height: AppSizes.spaceBtwSections,),
                  // SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                  // const SizedBox(height: AppSizes.spaceBtwSections,),
                  const AppSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'This is Product description for Blue Nike Sleeve less vest. There are more things can be added but i am just practicing and nothing else. ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          'Ratings and reviews are verified and are from people who use the same type of device that you see.'),
                      const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                      const AppOverallProductRating(),
                      const AppRatingBarIndicator(
                        rating: 3.5,
                      ),
                      Text(
                        '12,611',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwSections,
                      ),
                      const UserReviewCard(),
                      const UserReviewCard(),
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
