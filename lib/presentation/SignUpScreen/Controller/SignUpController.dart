

import 'package:expensetracker/Reposetory/Auth_Reposetory.dart';
import 'package:expensetracker/routes/App_Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final NumberController = TextEditingController();
  final authRepository = AuthRepo();
  var isChecked = false.obs;
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  var verificationId = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  // Function to send the verification code
  Future<void> sendVerificationCode() async {
    isLoading.value = true;
    try {
      bool result = await authRepository.sendVerificationCode(NumberController.text);
      isLoading.value = false;

      if (result) {
        Get.offNamed(AppRoutes.VerificationScreen);
      } else {
        showErrorSnackbar('Something went wrong. Please try again.');
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'Verification failed: ${e.toString()}';
      showErrorSnackbar('Verification failed: ${e.toString()}');
    }
  }

  // Function to verify the code entered by the user
  Future<void> verifyCode(String smsCode) async {
    isLoading.value = true;
    try {
      var result = await authRepository.verifyCodeAndSignIn(smsCode);
      isLoading.value = false;

      Get.offAllNamed(AppRoutes.TabBarScreen);
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'Error: ${e.toString()}';
      showErrorSnackbar('Error: ${e.toString()}');
    }
  }

  void showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
    );
  }
}
