import 'package:e_commerce_app/backend/update_name_controller.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'Use real name for easy verification. This Name wiil appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            Form(
              key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => AppValidator.validateEmptyText('First Name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: AppTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwInputField,),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => AppValidator.validateEmptyText('Last Name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: AppTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)
                      ),
                    ),

                  ],
            )),
            const SizedBox(height: AppSizes.spaceBtwSections,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}
