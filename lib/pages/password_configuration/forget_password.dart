import 'package:e_commerce_app/backend/Authentication%20Backend/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: AppSizes.spaceBtwItems,),
            Text(AppTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: AppSizes.spaceBtwItems,),


            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: AppValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: AppTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections,),

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(), child: const Text(AppTexts.submit))),
          ],
        ),
      ),
    );
  }
}
