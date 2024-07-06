
import 'package:e_commerce_app/backend/Authentication%20Backend/login/login_controller.dart';
import 'package:e_commerce_app/pages/password_configuration/forget_password.dart';
import 'package:e_commerce_app/pages/signup/signup.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class AppLoginForm extends StatelessWidget {
  const AppLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                validator: (value)=> AppValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: AppTexts.email),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwInputField,
              ),
              Obx(
                ()=> TextFormField(
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
                height: AppSizes.spaceBtwInputField / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)),
                      const Text(AppTexts.rememberMe)
                    ],
                  ),
                  TextButton(
                      onPressed: () => Get.to(() => const ForgetPassword()),
                      child: const Text(AppTexts.forgetPassword)),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>  controller.emailAndPasswordSignIn(), child: const Text(AppTexts.signIn))),
              const SizedBox(height: AppSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Get.to(() => const SignupScreen()),
                      child: const Text(AppTexts.createAccount))),
              const SizedBox(height: AppSizes.spaceBtwSections),
            ],
          ),
        ));
  }
}
