import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/AppRoundedContainer.dart';
import 'app_brand_card.dart';

class AppBrandShowCase extends StatelessWidget {
  const AppBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(AppSizes.md),
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      child: Column(
        children: [
          const AppBrandCard(
            showBorder: false,
          ),
          const SizedBox(height: AppSizes.spaceBtwItems,),

          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: AppRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(AppSizes.md),
        margin: const EdgeInsets.all(AppSizes.sm),
        backgroundColor: AppHelperFunction.isDarkMode(context)
            ? AppColors.darkerGrey
            : AppColors.light,
        child: Image(
            fit: BoxFit.contain, image: AssetImage(image)),
      ));
}
