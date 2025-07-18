import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:onelook/repository/auth_repository.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> logoAnimation;
  late Animation<double> textOpacity;
  var showText = false.obs;
  final AuthRepository _authRepo = AuthRepository();

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

    Future.delayed(Duration(seconds: 2), () async {
      showText.value = true;
      controller.forward();

      await Future.delayed(Duration(seconds: 1)); // give time for animation
      final user = _authRepo.getCurrentUser();
      if (user != null) {
        Get.offAllNamed('/home');
      }
    });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
