import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/repository/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepo = AuthRepository();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var obscureText = true.obs;
  var isLoading = false.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showError('Please fill all fields');
      return;
    }

    try {
      isLoading.value = true;
      final user = await _authRepo.login(email: email, password: password);
      isLoading.value = false;

      if (user != null) {
        Get.offAllNamed('/navbar');
      } else {
        _showError('Login failed. Please try again.');
      }
    } catch (e) {
      isLoading.value = false;
      _showError(e.toString());
    }
  }

  void _showError(String message) {
    Get.snackbar(
      'Login Failed',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
