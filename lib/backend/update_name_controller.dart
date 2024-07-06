
import 'package:e_commerce_app/backend/user_controller.dart';
import 'package:e_commerce_app/pages/profile/profile.dart';
import 'package:e_commerce_app/repository/user/user_repository.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try{
      AppFullScreenLoader.openLoadingDialog('We are updating your information...', AppImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AppFullScreenLoader.stopLoading();
        return;
      }
      if(!updateUserNameFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {'FirstName' : firstName.text.trim(), 'LastName' : lastName.text.trim()};
      await userRepository.updateSingleField(name);
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      AppFullScreenLoader.stopLoading();
      AppLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated');
      Get.off(()=> const ProfileScreen());
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}