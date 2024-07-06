import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class AppCategoryShimmer extends StatelessWidget {
  const AppCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_,__) => const SizedBox(width: AppSizes.spaceBtwItems,),
          itemBuilder: (_,__) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppShimmerEffect(width: 55, height: 55,radius: 55,),
                SizedBox(height: AppSizes.spaceBtwItems / 2,),
                AppShimmerEffect(width: 55, height: 8)

              ],
            );
          },
      ),
    );
  }
}
