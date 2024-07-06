import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/icons/app_circular_icon.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/pages/home/home.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            AppCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
          ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              AppGridLayout(itemCount: 4, itemBuilder: (_, index) => const AppProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
