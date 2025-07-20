import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/onboarding/calm.svg',
      'title': 'Keep calm and stay in control',
      'description': 'You can check your health with just one.',
    },
    {
      'image': 'assets/onboarding/pills.svg',
      'title': 'Don\'t miss a single pill, ever!',
      'description': 'Plan your supplementation in details.',
    },
    {
      'image': 'assets/onboarding/yoga.svg',
      'title': 'Exercise more & breathe better',
      'description': 'Learn, measure, set daily goals.',
    },
  ];

  void setCurrentPage(int page) {
    currentPage.value = page;
  }

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    } else {
      Get.offNamed('/login');
    }
  }
}
