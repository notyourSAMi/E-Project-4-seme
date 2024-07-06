
import 'package:e_commerce_app/pages/password_configuration/reset_password.dart';
import 'package:e_commerce_app/repository/authentication/authentication.repository.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      AppFullScreenLoader.openLoadingDialog('Logging you in...', AppImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      if(!forgetPasswordFormKey.currentState!.validate()){
        AppFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      AppFullScreenLoader.stopLoading();

      AppLoaders.successSnackBar(title: 'Email Send', message: 'Email Link Send to Reset your Password'.tr);

      Get.to(() => ResetScreen(email: email.text.trim(),));

    } catch(e){
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      AppFullScreenLoader.openLoadingDialog('Logging you in...', AppImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      AppFullScreenLoader.stopLoading();

      AppLoaders.successSnackBar(title: 'Email Send', message: 'Email Link Send to Reset your Password'.tr);

    } catch(e){
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }

  }

}