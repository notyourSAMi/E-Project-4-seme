import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/pages/address/add_new_address.dart';
import 'package:e_commerce_app/pages/address/widget/single_address.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add,color: AppColors.white,),
      ),
      appBar: CustomAppBar(
        title: Text('Adresses', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
             AppSingleAddress(selectedAddress: false ),
             AppSingleAddress(selectedAddress: true )

            ],
        ),
        ),
      ),
    );
  }
}
