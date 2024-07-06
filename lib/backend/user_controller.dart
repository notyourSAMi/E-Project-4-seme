
import 'package:e_commerce_app/backend/Authentication%20Backend/user_model.dart';
import 'package:e_commerce_app/pages/login/login.dart';
import 'package:e_commerce_app/pages/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:e_commerce_app/repository/authentication/authentication.repository.dart';
import 'package:e_commerce_app/repository/user/user_repository.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/helpers/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }
  Future<void> fetchUserRecord() async {
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false ;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {

      await fetchUserRecord();
      if(user.value.id.isEmpty){
        if (userCredentials != null) {
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          await userRepository.saveUserRecord(user);
        }
      }

    } catch (e) {
      AppLoaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information. You can re-save your data in your profile.'
      );
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),child: Text('Delete')),
      ),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: const Text('Cancle'))
    );
  }

  void deleteUserAccount() async {
    try{
      AppFullScreenLoader.openLoadingDialog('Processing', AppImages.docerAnimation);
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          AppFullScreenLoader.stopLoading();
          Get.off(() => const LoginScreen());
        } else if(provider == 'password') {
          AppFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch(e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  Future<void> reAuthenticateEmailAndAPasswordUser() async {
    try{
      AppFullScreenLoader.openLoadingDialog('Processing', AppImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AppFullScreenLoader.stopLoading();
        return;
      }
      if(!reAuthFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateEmailAndAPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      AppFullScreenLoader.stopLoading();
      Get.to(() => const LoginScreen());

    } catch(e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
  try{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
    if(image != null){
      final imageUrl = await userRepository.uploadImage('User/Images/Profile/', image);
      Map<String,dynamic> json = {'ProfilePicture': imageUrl,};
      await userRepository.updateSingleField(json);
      user.value.profilePicture = imageUrl;
      AppLoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');

    }
  } catch (e) {
    AppLoaders.errorSnackBar(title: 'Oh Snap!', message: 'Something went wrong: $e');
  }
  }
}