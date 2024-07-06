import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/app_circular_images.dart';
import '../texts/app_brand_title_text_with_verfied_icon.dart';
import '../custom_shapes/containers/AppRoundedContainer.dart';

class AppBrandCard extends StatelessWidget {
  const AppBrandCard({
    super.key, required this.showBorder, this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: AppRoundedContainer(
        padding: const EdgeInsets.all(AppSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: AppCirularImage(
                isNetworkImage: false,
                image: AppImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: darkMode
                    ? AppColors.white
                    : AppColors.dark,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const AppBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                  ),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
