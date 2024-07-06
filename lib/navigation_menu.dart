
import 'package:e_commerce_app/pages/home/home.dart';
import 'package:e_commerce_app/pages/settings/settings.dart';
import 'package:e_commerce_app/pages/store/store.dart';
import 'package:e_commerce_app/pages/wishlist/wishlist.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? AppColors.black : AppColors.white,
          indicatorColor: darkMode ? AppColors.white.withOpacity(0.1) : AppColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.map), label: 'Map'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Favorite'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() =>  controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const GoogleMap(),
    const FavouriteScreen(),
    const SettingsScreen()
  ];
}

