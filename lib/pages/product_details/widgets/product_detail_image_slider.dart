import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import '../../../../../common/widgets/icons/app_circular_icon.dart';
import '../../../../../common/widgets/images/app_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return AppCurvedEdgeWidget(
      child: Container(
        color: darkMode ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding:
                EdgeInsets.all(AppSizes.productImageRadius * 2),
                child: Center(
                    child: Image(
                        image: AssetImage(AppImages.productImage5))),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: AppSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => AppRoundedImage(
                      width: 80,
                      backgroundColor: darkMode ? AppColors.dark : AppColors.white,
                      border: Border.all(color: AppColors.primary),
                      padding: const EdgeInsets.all(AppSizes.sm),
                      imageUrl: AppImages.productImage3),
                ),
              ),
            ),
            const   CustomAppBar(
              showBackArrow: true,
              actions: [
                AppCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
