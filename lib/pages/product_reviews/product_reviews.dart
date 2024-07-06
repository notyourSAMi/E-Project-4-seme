import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/pages/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:e_commerce_app/pages/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Reviews & Ratings'), showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ratings and reviews are verified and are from people who use the same type of device that you see.'),
            const SizedBox(height: AppSizes.spaceBtwItems,),
            const AppOverallProductRating(),
            const AppRatingBarIndicator(rating: 3.5,),
            Text('12,611',style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: AppSizes.spaceBtwSections,),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),
      ),
    );
  }
}




