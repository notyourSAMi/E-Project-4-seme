import 'package:e_commerce_app/common/widgets/images/app_circular_images.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppVerticalImageText extends StatelessWidget {
  const AppVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor,
    this.onTap, this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final bool isNetworkImage ;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            AppCirularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: AppSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? AppColors.light : AppColors.dark,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            SizedBox(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    );
  }
}
