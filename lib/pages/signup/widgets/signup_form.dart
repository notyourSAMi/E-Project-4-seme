import 'package:e_commerce_app/backend/Authentication%20Backend/signup/signup_controller.dart';
import 'package:e_commerce_app/pages/signup/widgets/terms_condition_checkbox.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class AppSignupForm extends StatelessWidget {
  const AppSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value) => AppValidator.validateEmptyText('First Name', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: AppTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwInputField,
            ),
            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => AppValidator.validateEmptyText('Last Name', value),

                expands: false,
                decoration: const InputDecoration(
                    labelText: AppTexts.lastName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            )
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwInputField,
        ),
        TextFormField(
          validator: (value) => AppValidator.validateEmptyText('Username', value),
          controller: controller.username,
          decoration: const InputDecoration(
              labelText: AppTexts.username,
              prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwInputField,
        ),
        TextFormField(
          controller: controller.email,
          validator: (value) => AppValidator.validateEmail(value),
          decoration: const InputDecoration(
              labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwInputField,
        ),
        TextFormField(
          controller: controller.phoneNumber,
          validator: (value) => AppValidator.validatePhoneNumber(value),
          decoration: const InputDecoration(
              labelText: AppTexts.phoneNum, prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwInputField,
        ),
        Obx(() => TextFormField(
            controller: controller.password,
            validator: (value) => AppValidator.validatePassword(value),
            obscureText: controller.hidePassword.value,
            decoration: InputDecoration(
                labelText: AppTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(onPressed: () =>
                controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))),
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
        const AppTermsAndConditionCheckbox(),
        const SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signUp(context),
              child: const Text(AppTexts.createAccount),
            ))
      ],
    ));
  }
}
