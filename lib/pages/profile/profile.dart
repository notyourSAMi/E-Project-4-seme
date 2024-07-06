import 'package:e_commerce_app/backend/user_controller.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/app_circular_images.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/pages/profile/widgets/change_name.dart';
import 'package:e_commerce_app/pages/profile/widgets/profile_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx( () {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : AppImages.user;
                     return AppCirularImage(image: image,width: 80, height: 80,isNetworkImage: networkImage.isNotEmpty,);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems,),
              const AppSectionHeading(title: 'Profile Information'),
              const SizedBox(height: AppSizes.spaceBtwItems,),
              AppProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: 'Name', value: controller.user.value.fullName),
              AppProfileMenu(onPressed: () {}, title: 'Username', value: controller.user.value.username),

              const SizedBox(height: AppSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              const AppSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              AppProfileMenu(onPressed: () {},icon: Iconsax.copy, title: 'User ID', value: controller.user.value.id),
              AppProfileMenu(onPressed: () {}, title: 'E-mail', value: controller.user.value.email),
              AppProfileMenu(onPressed: () {}, title: 'Phone Number', value: controller.user.value.phoneNumber),
              AppProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              AppProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '10 Oct, 1994'),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems,),

              Center(
                child: TextButton(onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )




            ],
          ),
        ),
      ),
    );
  }
}
