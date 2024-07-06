import 'package:e_commerce_app/backend/user_controller.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: AppValidator.validateEmail,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: AppTexts.email),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwInputField,
                ),
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        AppValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: AppTexts.password,
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: const Icon(Iconsax.eye_slash))),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwSections,),

                SizedBox(
                  width: double.infinity,
                  child:  ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndAPasswordUser(), child: const Text('Verify')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
