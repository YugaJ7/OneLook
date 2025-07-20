import 'package:get/get.dart';
import 'package:onelook/controllers/home/add_activity.dart';
import 'package:onelook/controllers/home/add_supplement.dart';
import 'package:onelook/controllers/auth/forgot_controller.dart';
import 'package:onelook/controllers/auth/login_controller.dart';
import 'package:onelook/controllers/auth/onboarding_controller.dart';
import 'package:onelook/controllers/auth/sign_up_controller.dart';
import 'package:onelook/controllers/auth/splash_controller.dart';
import 'package:onelook/controllers/home/navbar_controller.dart';
import 'package:onelook/data/repository/auth_repository.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(AuthRepository(), permanent: true); 
  }
}

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

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavbarController());
    // Get.lazyPut(() => HomeScreenController());
    // Get.lazyPut(() => ActivityController());
    // Get.lazyPut(() => ProgressController());
    // Get.lazyPut(() => SettingController());
  }
}