import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/button.dart';
import 'package:onelook/components/widgets/buttons/elevated_button.dart';
import 'package:onelook/components/widgets/textfield/text_field.dart';
import '../../components/style/text.dart';
import '../../constants/app_color.dart';
import '../../controllers/forgot_controller.dart';

class ForgotScreen extends StatelessWidget {
  final ForgotController controller = Get.find();

  ForgotScreen({super.key});

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
                "Enter your e-mail",
                style: TextStyles.withColor(textcolor: AppColors.deepblue)
                    .headline1,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'You will receive a link to confirm the password change to the e-mail address provided',
              style:
                  TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext2,
              textAlign: TextAlign.center,
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
            Spacer(),
            //Confirm Elevated Button
            SizedBox(
              height: 60,
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'Confirm e-mail',
                buttonStyle: ButtonStyles.buttonprimary,
                textStyle: TextStyles.buttontext1,
                onPressed: controller.confirmEmail,
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
