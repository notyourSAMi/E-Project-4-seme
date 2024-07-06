import 'package:e_commerce_app/backend/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/app_circular_images.dart';

class AppUserProfileTitle extends StatelessWidget {
  const AppUserProfileTitle({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final networkImage = controller.user.value.profilePicture;
    final image = networkImage.isNotEmpty ? networkImage : AppImages.user;
    return ListTile(
      leading: AppCirularImage(
        image: image,
        width: 50,
        height: 50,
        padding: 0,
        isNetworkImage: networkImage.isNotEmpty,
      ),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: AppColors.white,)),

    );
  }
}
