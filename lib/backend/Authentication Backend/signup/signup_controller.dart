
import 'package:e_commerce_app/backend/Authentication%20Backend/user_model.dart';
import 'package:e_commerce_app/pages/signup/verify_email.dart';
import 'package:e_commerce_app/repository/authentication/authentication.repository.dart';
import 'package:e_commerce_app/repository/user/user_repository.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();


  Future<void> signUp(BuildContext context) async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'We are processing your information...', AppImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
      return;
      }
        if (!signupFormKey.currentState!.validate()) {
          AppFullScreenLoader.stopLoading();
          return;
        }
        if (!privacyPolicy.value) {
          AppFullScreenLoader.stopLoading();
          AppLoaders.warningSnackBar(
              title: 'Accept Privacy Policy',
              message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
          return;
        }
        final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
        final newUser = UserModel(
            id: userCredential.user!.uid,
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            username: username.text.trim(),
            email: email.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
            profilePicture: '');
        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);

        AppFullScreenLoader.stopLoading();


        AppLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');
        Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyEmailScreen()));
      }
     catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
