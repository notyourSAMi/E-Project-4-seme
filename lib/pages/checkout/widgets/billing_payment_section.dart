import 'package:e_commerce_app/common/widgets/custom_shapes/containers/AppRoundedContainer.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppBillingPaymentSection extends StatelessWidget {
  const AppBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Column(
      children: [
        AppSectionHeading(title: 'Payment Method', buttonTitle: 'Change', showActionButton: true, onPressed: () {},),
        const SizedBox(height: AppSizes.spaceBtwItems / 2,),
        Row(
          children: [
            AppRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: darkMode ? AppColors.light : AppColors.white,
              padding: const EdgeInsets.all(AppSizes.sm),
              child: const Image(image: AssetImage(AppImages.paypal), fit: BoxFit.contain,),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2,),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
