import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/firebase_options.dart';
import 'package:onelook/screens/auth/splash.dart';
import 'package:onelook/screens/auth/onboarding.dart';
import 'package:onelook/screens/auth/sign_up.dart';
import 'package:onelook/screens/auth/login.dart';
import 'package:onelook/screens/auth/forgot.dart';
import 'package:onelook/screens/auth/new_pass.dart';
import 'package:onelook/components/navbar/navbar.dart';
import 'package:onelook/screens/home/add_activity.dart';
import 'package:onelook/screens/home/add_supplement.dart';
import 'package:onelook/screens/settings/activity_manager.dart';
import 'binding/all_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/', page: () => SplashScreen(), binding: SplashBinding()),
        GetPage(
            name: '/onboarding',
            page: () => OnboardingScreen(),
            binding: OnboardingBinding()),
        GetPage(
            name: '/signup',
            page: () => SignUpScreen(),
            binding: SignUpBinding()),
        GetPage(
            name: '/login', page: () => LoginScreen(), binding: LoginBinding()),
        GetPage(
            name: '/forgotpassword',
            page: () => ForgotScreen(),
            binding: ForgotBinding()),
        GetPage(
            name: '/add_supplement',
            page: () => AddSupplementScreen(),
            binding: AddSupplementBinding()
            ),
        GetPage(
            name: '/add_activity',
            page: () => AddActivityScreen(),
            binding: AddActivityBinding()
            ),
        GetPage(name: '/newpassword', page: () => NewPassScreen()),
        GetPage(name: '/confirm', page: () => ConfirmScreen()),
        GetPage(name: '/navbar', page: () => Navbar()),
        GetPage(name: '/activity_manager', page: () => ActivityManagerScreen()),
      ],
    );
  }
}
