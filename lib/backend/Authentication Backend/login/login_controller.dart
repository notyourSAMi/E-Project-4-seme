

import 'package:e_commerce_app/backend/user_controller.dart';
import 'package:e_commerce_app/repository/authentication/authentication.repository.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class LoginController extends GetxController{

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
   if(localStorage.read('REMEMBER_ME_EMAIL') != null || localStorage.read('REMEMBER_ME_PASSWORD') != null){
     email.text = localStorage.read('REMEMBER_ME_EMAIL');
     password.text = localStorage.read('REMEMBER_ME_PASSWORD');
   }
    super.onInit();
  }

  // --- Email And Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try{
      AppFullScreenLoader.openLoadingDialog('Logging you in...', AppImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      if(!loginFormKey.currentState!.validate()){
        AppFullScreenLoader.stopLoading();
        return;
      }
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      AppFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch(e){
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  // --- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try{
      AppFullScreenLoader.openLoadingDialog('Logging you in...', AppImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AppFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();
      await userController.saveUserRecord(userCredentials);

      AppFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch(e){
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

}