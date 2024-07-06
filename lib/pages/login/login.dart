import 'package:e_commerce_app/common/styles/spacing_style.dart';
import 'package:e_commerce_app/pages/login/widgets/login_form.dart';
import 'package:e_commerce_app/pages/login/widgets/login_header.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/widgets.login_signup/form_divider.dart';
import '../../../../common/widgets/widgets.login_signup/social_buttons.dart';
import '../../../../utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              AppLoginHeader(dark: dark),
              const AppLoginForm(),
              AppFormDivider(dividerText: AppTexts.orSignInWith.capitalize!,),
              const SizedBox(height: AppSizes.spaceBtwSections,),

              const AppSocialsButtons()
            ],
          ),
        ),
      ),
    );
  }
}





