import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/product_cards/product_price_tag.dart';
import '../../../../../utils/constants/sizes.dart';

class AppCardItems extends StatelessWidget {
  const AppCardItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: AppSizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children:  [
          const AppCartItem(),
        if(showAddRemoveButton) const SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          if(showAddRemoveButton) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  AppProductQuantityWithAddRemoveButton(),
                ],
              ),
              AppProdutctPriceText(price: '256')
            ],
          )
        ],
      ),
    );
  }
}
