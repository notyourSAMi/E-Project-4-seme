import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppCirularImage extends StatelessWidget {
  const AppCirularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = AppSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ??
              (darkMode ? AppColors.black : AppColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
            child: isNetworkImage ? CachedNetworkImage(
              imageUrl: image,
              fit: fit,
              color: overlayColor,
              progressIndicatorBuilder: (context, url, downloadProgress) => const AppShimmerEffect(width: 55, height: 55,radius: 55,),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ) :
            Image(
              fit: fit,
              image: AssetImage(image),
              color: overlayColor,
            ),
        
        
        
        ),
      ),
    );
  }
}
