import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:onelook/controllers/user_controller.dart';
import 'package:onelook/data/repository/auth_repository.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> logoAnimation;
  late Animation<double> textOpacity;

  final showText = false.obs;
  final showStartButton = false.obs;

  final AuthRepository _authRepo = AuthRepository();
  final UserController _user = UserController();

  @override
  void onInit() {
    super.onInit();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    logoAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, -0.1),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));

    textOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ));

    _initSplashFlow();
  }

  Future<void> _initSplashFlow() async {
    await Future.delayed(const Duration(seconds: 2));

    showText.value = true;
    controller.forward();

    await Future.delayed(const Duration(seconds: 1));

    if (_authRepo.isLoggedIn) {
      _authRepo.cacheUserId();
      _user.setUserData(_authRepo.currentUser);
      Get.offAllNamed('/navbar');
    } else {
      showStartButton.value = true;
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
