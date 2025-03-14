import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/screens/splash.dart';
import 'package:onelook/screens/onboarding.dart';
import 'package:onelook/screens/sign_up.dart';
import 'package:onelook/screens/login.dart';
import 'package:onelook/screens/forgot.dart';
import 'package:onelook/screens/new_pass.dart';
import 'package:onelook/components/navbar/navbar.dart';
import 'binding/all_binding.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen(), binding: SplashBinding()),
        GetPage(name: '/onboarding', page: () => OnboardingScreen(), binding: OnboardingBinding()),
        GetPage(name: '/signup', page: () => SignUpScreen(), binding: SignUpBinding()),
        GetPage(name: '/login', page: () => LoginScreen(), binding: LoginBinding()),
        GetPage(name: '/forgotpassword', page: () => ForgotScreen(), binding: ForgotBinding()),
        GetPage(name: '/newpassword', page: () => NewPassScreen()),
        GetPage(name: '/confirm', page: () => ConfirmScreen()),
        GetPage(name: '/navbar', page: () => Navbar()),
      ],
    );
  }
}