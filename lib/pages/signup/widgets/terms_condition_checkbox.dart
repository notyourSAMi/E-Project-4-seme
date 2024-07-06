import 'package:e_commerce_app/backend/Authentication%20Backend/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AppTermsAndConditionCheckbox extends StatelessWidget {
  const AppTermsAndConditionCheckbox({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = AppHelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value)=> controller.privacyPolicy.value = !controller.privacyPolicy.value))),
        const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${AppTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${AppTexts.privacyPolicy} ',
              style:
              Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark
                    ?     AppColors.white
                    : AppColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark
                    ? AppColors.white
                    : AppColors.primary,
              )),
          TextSpan(
              text: 'and ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: AppTexts.termsOfUse,
              style:
              Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark
                    ? AppColors.white
                    : AppColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark
                    ? AppColors.white
                    : AppColors.primary,
              )),
        ]))
      ],
    );
  }
}
