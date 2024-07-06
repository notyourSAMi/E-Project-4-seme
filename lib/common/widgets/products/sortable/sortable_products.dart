import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class AppSortableProducts extends StatelessWidget {
  const AppSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newst', 'Popularity'].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections,),
        AppGridLayout(itemCount: 4, itemBuilder: (_, index) => const AppProductCardVertical())
      ],
    );
  }
}
