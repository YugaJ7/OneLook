import 'package:flutter/material.dart';
import 'package:onelook/screens/forgot.dart';
import 'package:onelook/screens/login.dart';
import 'package:onelook/screens/new_pass.dart';

import 'screens/onboarding.dart';
import 'screens/sign_up.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/forgotpassword': (context) => ForgotScreen(),
        '/newpassword': (context) => NewPassScreen(),
        '/confirm': (context) => ConfirmScreen(),
      },
    );
  }
}
