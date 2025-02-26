import 'package:flutter/material.dart';
import 'package:onelook/components/button.dart';
import 'package:onelook/components/elevated_button.dart';
import 'package:onelook/components/widgets/text_field.dart';

import '../components/text.dart';
import '../components/widgets/social_button.dart';
import '../constants/app_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool hasMinLength = false;
  bool hasUpperLower = false;
  bool hasNumberOrSymbol = false;
  bool isButtonEnabled = false;
  bool isChecked = false;
  bool _obscureText = true;

  void _validatePassword(String password) {
    setState(() {
      hasMinLength = password.length >= 8;
      hasUpperLower = RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(password);
      hasNumberOrSymbol =
          RegExp(r'(?=.*\d)|(?=.*[!@#\$%^&*(),.?":{}|<>])').hasMatch(password);
      _updateButtonState();
    });
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled =
          hasMinLength && hasUpperLower && hasNumberOrSymbol && isChecked;
    });
  }

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
            SizedBox(height: 40),
            // Row(
            //   children: [
            //     SvgPicture.asset('assets/logosmall.svg'),
            //     SizedBox(width: 10),
            //     Text('OneLook',
            //         style: TextStyles.withColor(textcolor: AppColors.deepblue)
            //             .headline1),
            //   ],
            // ),
            SizedBox(height: 20),
            Center(
              child: Text("Create an account",
                  style: TextStyles.withColor(textcolor: AppColors.deepblue)
                      .headline1),
            ),
            SizedBox(height: 20),
            AuthTextField(
                label: "Full Name",
                hint: "Enter your name",
                icon: 'assets/login_sign/profile.png'),
            SizedBox(height: 12),
            AuthTextField(
                label: "E-mail",
                hint: "Enter your e-mail here",
                icon: 'assets/login_sign/email.png'),
            SizedBox(height: 12),
            Text("Password",
                style: TextStyles.withColor(textcolor: AppColors.darkgrey)
                    .bodytext2),
            SizedBox(height: 4),
            TextField(
              cursorColor: AppColors.darkgrey,
              style:
                  TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext2,
              controller: _passwordController,
              obscureText: _obscureText,
              onChanged: _validatePassword,
              decoration: InputDecoration(
                hintText: "Place the password here",
                hintStyle: TextStyles.withColor(textcolor: AppColors.darkgrey)
                    .bodytext2,
                prefixIcon: Image.asset(
                  'assets/login_sign/locked.png',
                  scale: 3,
                ),
                suffixIcon: IconButton(
                  color: AppColors.darkgrey,
                  icon: Icon(_obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                focusColor: AppColors.lilac,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lilacdark),
                    borderRadius: BorderRadius.circular(14)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lilacdark),
                    borderRadius: BorderRadius.circular(14)),
                fillColor: AppColors.lilac,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lilacdark),
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            SizedBox(height: 10),
            _buildValidationRow("At least 8 characters", hasMinLength),
            SizedBox(height: 8),
            _buildValidationRow(
                "Both uppercase and lowercase characters", hasUpperLower),
            SizedBox(height: 8),
            _buildValidationRow(
                "At least one number or symbol", hasNumberOrSymbol),
            SizedBox(height: 20),
            Divider(color: AppColors.lightgrey, thickness: 1.5),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  side: BorderSide(color: AppColors.darkgrey),
                  checkColor: AppColors.purpleplum,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                      _updateButtonState();
                    });
                  },
                ),
                Expanded(
                    child: Text(
                        "By continuing you accept our Privacy Policy and Term of Use",
                        style:
                            TextStyles.withColor(textcolor: AppColors.darkgrey)
                                .bodytext3))
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'Sign Up',
                buttonStyle: ButtonStyles.buttonprimary,
                textStyle: TextStyles.buttontext1,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/navbar', (route) => false);
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Divider(color: AppColors.lightgrey, thickness: 1.5)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Or",
                      style: TextStyles.withColor(textcolor: AppColors.deepblue)
                          .bodytext3),
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
                SocialButton(
                  assetPath: "assets/login_sign/facebook.png",
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",
                    style: TextStyles.withColor(textcolor: AppColors.deepblue)
                        .bodytext3),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero, 
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent),
                  child: Text(
                    "Log in",
                    style:
                        TextStyles.withColor(textcolor: AppColors.purpleplum)
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

  Widget _buildValidationRow(String text, bool isValid) {
    return Row(
      children: [
        Icon(isValid ? Icons.check : Icons.close,
            color: isValid ? Colors.green : Colors.red),
        SizedBox(width: 8),
        Text(text,
            style:
                TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext3),
      ],
    );
  }
}
