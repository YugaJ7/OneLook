import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../components/style/button.dart';
import '../../components/widgets/buttons/elevated_button.dart';
import '../../controllers/newpass_controller.dart';
import '../../components/style/text.dart';
import '../../constants/app_color.dart';

class NewPassScreen extends StatelessWidget {
  final NewPassController controller = Get.put(NewPassController());

  NewPassScreen({super.key});

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
            SizedBox(height: MediaQuery.of(context).size.height * 0.075),
            Center(
              child: Text(
                "Enter a new password",
                style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                    .headline1,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Password",
              style:
                  TextStyles.withColor(textcolor: AppColors.darkGrey).bodytext2,
            ),
            SizedBox(height: 4),
            Obx(() => TextField(
                  cursorColor: AppColors.darkGrey,
                  style: TextStyles.withColor(textcolor: AppColors.darkGrey)
                      .bodytext2,
                  controller: controller.passwordController,
                  obscureText: controller.obscureText.value,
                  onChanged: (value) => controller.validatePassword(value),
                  decoration: InputDecoration(
                    hintText: "Place the password here",
                    hintStyle:
                        TextStyles.withColor(textcolor: AppColors.darkGrey)
                            .bodytext2,
                    prefixIcon: Image.asset(
                      'assets/login_sign/locked.png',
                      scale: 3,
                    ),
                    suffixIcon: IconButton(
                      color: AppColors.darkGrey,
                      icon: Icon(controller.obscureText.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      onPressed: controller.toggleObscureText,
                    ),
                    focusColor: AppColors.lilacPetals,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lilacPetalsDark),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lilacPetalsDark),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    fillColor: AppColors.lilacPetals,
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
            Spacer(),

            //Confirm Button
            SizedBox(
              height: 60,
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'Confirm',
                buttonStyle: ButtonStyles.buttonprimary,
                textStyle: TextStyles.buttontext1,
                onPressed: controller.confirmPassword,
              ),
            ),
            SizedBox(height: 40),
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
                  TextStyles.withColor(textcolor: AppColors.darkGrey).bodytext3,
            ),
          ],
        ));
  }
}

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Center(child: SvgPicture.asset('assets/login_sign/password.svg')),
            SizedBox(height: 40),
            Center(
              child: Text(
                "Your password has been changed",
                style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                    .headline2,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'Log in',
                buttonStyle: ButtonStyles.buttonprimary,
                textStyle: TextStyles.buttontext1,
                onPressed: () => Get.offAllNamed('/navbar'),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
