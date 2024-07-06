import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/list_tiles/settings_menu_title.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/pages/address/address.dart';
import 'package:e_commerce_app/pages/order/order.dart';
import 'package:e_commerce_app/pages/profile/profile.dart';
import 'package:e_commerce_app/repository/authentication/authentication.repository.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tiles/user_profile_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppPrimaryHeaderContainer(
                child: Column(
              children: [
                CustomAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: AppColors.white),
                  ),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                AppUserProfileTitle(onPressed: () => Get.to(() => const ProfileScreen()),),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const  AppSectionHeading(title: 'Account Settings'),
                 const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                  onTap: () => Get.to(() => const UserAddressScreen()),),
                    const SettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                    ),


                   SettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-Progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),),
                  const SettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Back Account',
                      subTitle: 'Withdraw balance to registered bank account'),
                  const SettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons'),
                  const SettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message'),
                  const SettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts'),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  const AppSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  const SettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase'),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),

                  ),

                  SettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => AuthenticationRepository.instance.logout(), child: const Text('Logout'),),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections * 2.5,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
