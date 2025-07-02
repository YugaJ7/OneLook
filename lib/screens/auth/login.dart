import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/button.dart';
import 'package:onelook/components/widgets/buttons/elevated_button.dart';
import 'package:onelook/components/widgets/buttons/social_button.dart';
import 'package:onelook/components/widgets/textfield/auth_text_field.dart';
import '../../components/style/text.dart';
import '../../constants/app_color.dart';
import '../../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.find();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.075),
            Center(
              child: Text(
                "Welcome back",
                style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                    .headline1,
              ),
            ),
            SizedBox(height: 20),

            //Email Text Field
            AuthTextField(
              label: 'E-mail',
              hint: 'Enter your e-mail here',
              icon: 'assets/login_sign/email.png',
              controller: controller.emailController,
              obscureText: false.obs,
            ),
            SizedBox(height: 20),

            //Password Text Field
            AuthTextField(
              label: 'Password',
              hint: 'Enter your password',
              icon: 'assets/login_sign/locked.png',
              controller: controller.passwordController,
              obscureText: controller.obscureText,
              toggleObscureText: controller.toggleObscureText,
            ),
            SizedBox(height: 20),

            //Forgot Password Text Button
            Center(
              child: TextButton(
                onPressed: () => Get.toNamed('/forgotpassword'),
                child: Text(
                  'Forgot your password?',
                  style: TextStyles.withColor(textcolor: AppColors.purplePlum)
                      .bodytext3,
                ),
              ),
            ),
            Spacer(),

            //Login Elevated Button
            Obx(() => SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text:
                        controller.isLoading.value ? 'Logging in...' : 'Log in',
                    buttonStyle: ButtonStyles.buttonprimary,
                    textStyle: TextStyles.buttontext1,
                    onPressed: controller.login,
                  ),
                )),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                    child: Divider(color: AppColors.lightGrey, thickness: 1.5)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Or",
                    style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                        .bodytext3,
                  ),
                ),
                Expanded(
                    child: Divider(color: AppColors.lightGrey, thickness: 1.5)),
              ],
            ),
            SizedBox(height: 20),

            //Social Login Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(assetPath: 'assets/login_sign/google.png'),
                SizedBox(width: 50),
                SocialButton(assetPath: 'assets/login_sign/facebook.png'),
              ],
            ),
            SizedBox(height: 20),

            //Sign Up Option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account yet? ",
                  style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .bodytext3,
                ),
                TextButton(
                  onPressed: () => Get.offNamed('/signup'),
                  child: Text(
                    "Sign up",
                    style: TextStyles.withColor(textcolor: AppColors.purplePlum)
                        .bodytext3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 45),
          ],
        ),
      ),
    );
  }
}
