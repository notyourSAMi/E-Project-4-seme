import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class AppBrandTitleWithVerifiedIcon extends StatelessWidget {
  const AppBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = AppColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Islamabad",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          width: AppSizes.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: AppColors.primary,
          size: AppSizes.iconXs,
        )
      ],
    );
  }
}
