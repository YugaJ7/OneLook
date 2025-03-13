import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/button.dart';
import 'package:onelook/components/elevated_button.dart';
import 'package:onelook/components/widgets/text_field.dart';
import '../components/text.dart';
import '../components/widgets/social_button.dart';
import '../constants/app_color.dart';
import '../controllers/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                "Create an account",
                style: TextStyles.withColor(textcolor: AppColors.deepblue)
                    .headline1,
              ),
            ),
            SizedBox(height: 20),

            // Full Name Field
            AuthTextField(
              label: "Full Name",
              hint: "Enter your name",
              icon: 'assets/login_sign/profile.png',
              controller: controller.fullNameController,
              obscureText: false.obs,
            ),
            SizedBox(height: 12),

            //Email Field
            AuthTextField(
              label: "E-mail",
              hint: "Enter your e-mail here",
              icon: 'assets/login_sign/email.png',
              controller: controller.emailController,
              obscureText: false.obs,
            ),
            SizedBox(height: 12),

            //Password Field
            Text(
              "Password",
              style:
                  TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext2,
            ),
            SizedBox(height: 4),
            Obx(() => TextField(
                  cursorColor: AppColors.darkgrey,
                  style: TextStyles.withColor(textcolor: AppColors.darkgrey)
                      .bodytext2,
                  controller: controller.passwordController,
                  obscureText: controller.obscureText.value,
                  onChanged: (value) => controller.validatePassword(value),
                  decoration: InputDecoration(
                    hintText: "Place the password here",
                    hintStyle:
                        TextStyles.withColor(textcolor: AppColors.darkgrey)
                            .bodytext2,
                    prefixIcon: Image.asset(
                      'assets/login_sign/locked.png',
                      scale: 3,
                    ),
                    suffixIcon: IconButton(
                      color: AppColors.darkgrey,
                      icon: Icon(controller.obscureText.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      onPressed: controller.toggleObscureText,
                    ),
                    focusColor: AppColors.lilac,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lilacdark),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lilacdark),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    fillColor: AppColors.lilac,
                    filled: true,
                  ),
                )),
            SizedBox(height: 10),

            _buildValidationRow(
                "At least 8 characters", controller.hasMinLength),
            SizedBox(height: 8),
            _buildValidationRow(
              "Both uppercase and lowercase characters",
              controller.hasUpperLower,
            ),
            SizedBox(height: 8),
            _buildValidationRow(
              "At least one number or symbol",
              controller.hasNumberOrSymbol,
            ),
            SizedBox(height: 20),
            Divider(color: AppColors.lightgrey, thickness: 1.5),
            SizedBox(height: 20),
            Row(
              children: [
                Obx(() => Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: BorderSide(color: AppColors.darkgrey),
                      checkColor: AppColors.purpleplum,
                      value: controller.isChecked.value,
                      onChanged: (value) {
                        controller.isChecked.value = value ?? false;
                        controller.updateButtonState();
                      },
                    )),
                Expanded(
                  child: Text(
                    "By continuing you accept our Privacy Policy and Term of Use",
                    style: TextStyles.withColor(textcolor: AppColors.darkgrey)
                        .bodytext3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            //Sign Up Button
            Obx(() => SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: controller.isLoading.value
                        ? 'Signing up...'
                        : 'Sign Up',
                    buttonStyle: ButtonStyles.buttonprimary,
                    textStyle: TextStyles.buttontext1,
                    onPressed: controller.signUp,
                  ),
                )),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Divider(color: AppColors.lightgrey, thickness: 1.5)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Or",
                    style: TextStyles.withColor(textcolor: AppColors.deepblue)
                        .bodytext3,
                  ),
                ),
                Expanded(
                    child: Divider(color: AppColors.lightgrey, thickness: 1.5)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(assetPath: "assets/login_sign/google.png"),
                SizedBox(width: 50),
                SocialButton(assetPath: "assets/login_sign/facebook.png"),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyles.withColor(textcolor: AppColors.deepblue)
                      .bodytext3,
                ),
                TextButton(
                  onPressed: () => Get.offNamed('/login'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text(
                    "Log in",
                    style: TextStyles.withColor(textcolor: AppColors.purpleplum)
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

  Widget _buildValidationRow(String text, RxBool isValid) {
    return Obx(() => Row(
          children: [
            Icon(isValid.value ? Icons.check : Icons.close,
                color: isValid.value ? Colors.green : Colors.red),
            SizedBox(width: 8),
            Text(
              text,
              style:
                  TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext3,
            ),
          ],
        ));
  }
}
