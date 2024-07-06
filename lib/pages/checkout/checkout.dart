import 'package:e_commerce_app/common/widgets/custom_shapes/containers/AppRoundedContainer.dart';
import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/pages/cart/widgets/cart_items.dart';
import 'package:e_commerce_app/pages/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_app/pages/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/pages/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Order Reviews',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppCardItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const AppCouponCode(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              AppRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(AppSizes.md),
                backgroundColor: darkMode ? AppColors.black : AppColors.white,
                child: const Column(
                  children: [
                    AppBillingAmountSection(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    AppBillingPaymentSection(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    AppBillingAddressSection(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
        bottomNavigationBar: Padding(padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: ElevatedButton(onPressed: () => Get.to(() => SuccessScreen(image: AppImages.successfulPaymentIcon, title: 'Payment Success!', subTitle: 'Your item will be shipped soon!', onPressed: () => Get.offAll(() => const NavigationMenu()),)), child: const Text('Checkout \$256.0'),),)
    );
  }
}

