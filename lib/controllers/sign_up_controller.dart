import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/repository/auth_repository.dart';

class SignUpController extends GetxController {
  final AuthRepository _authRepo = AuthRepository();

  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var obscureText = true.obs;

  var hasMinLength = false.obs;
  var hasUpperLower = false.obs;
  var hasNumberOrSymbol = false.obs;
  var isChecked = false.obs;
  var isButtonEnabled = false.obs;
  var isLoading = false.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void validatePassword(String password) {
    hasMinLength.value = password.length >= 8;
    hasUpperLower.value = RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(password);
    hasNumberOrSymbol.value =
        RegExp(r'(?=.*\d)|(?=.*[!@#\$%^&*(),.?":{}|<>])').hasMatch(password);
    updateButtonState();
  }

  void updateButtonState() {
    isButtonEnabled.value = hasMinLength.value &&
        hasUpperLower.value &&
        hasNumberOrSymbol.value &&
        isChecked.value;
  }

  void signUp() async {
    final name = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showError('Please fill all fields');
      return;
    }

    if (!hasMinLength.value || !hasUpperLower.value || !hasNumberOrSymbol.value) {
      String errorMessage = 'Password must meet the following:\n';
      if (!hasMinLength.value) errorMessage += '- At least 8 characters\n';
      if (!hasUpperLower.value) errorMessage += '- Upper & lowercase letters\n';
      if (!hasNumberOrSymbol.value) errorMessage += '- Number or special symbol';
      _showError(errorMessage);
      return;
    }

    if (!isChecked.value) {
      _showError('Please accept the privacy policy and terms.');
      return;
    }

    isLoading.value = true;

    try {
      await _authRepo.signUp(name: name, email: email, password: password);
      // Navigate to navbar after success
      Get.offAllNamed('/navbar');
    } catch (e) {
      _showError(e.toString().replaceFirst('Exception: ', ''));
    } finally {
      isLoading.value = false;
    }
  }
  void _showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
