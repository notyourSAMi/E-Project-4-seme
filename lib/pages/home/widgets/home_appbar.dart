import 'package:e_commerce_app/backend/user_controller.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return CustomAppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(AppTexts.homeAppBarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: AppColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const AppShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: AppColors.white));
            }
          }),
        ],
      ),
      actions: [
        AppCartCounterIcon(
          onPressed: () {},
          iconColor: AppColors.white,
        )
      ],
    );
  }
}
