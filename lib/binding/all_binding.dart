import 'package:get/get.dart';
import 'package:onelook/controllers/add_activity.dart';

import '../controllers/add_supplement.dart';
import '../controllers/forgot_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/onboarding_controller.dart';
import '../controllers/sign_up_controller.dart';
import '../controllers/splash_controller.dart';

// splash_binding.dart
class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

// onboarding_binding.dart
class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}

// login_binding.dart
class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

// signup_binding.dart
class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}

// forgot_binding.dart
class ForgotBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotController());
  }
}

// add_supplement_binding.dart
class AddSupplementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddSupplementController());
  }
}

// add_supplement_binding.dart
class AddActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddActivityController());
  }
}