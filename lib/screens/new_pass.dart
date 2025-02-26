import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onelook/components/button.dart';
import 'package:onelook/components/elevated_button.dart';

import '../components/text.dart';
import '../constants/app_color.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({super.key});

  @override
  _NewPassScreenState createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
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
              child: Text("Enter a new password",
                  style: TextStyles.withColor(textcolor: AppColors.deepblue)
                      .headline1),
            ),
            SizedBox(height: 20),
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
            Spacer(),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'Confirm',
                buttonStyle: ButtonStyles.buttonprimary,
                textStyle: TextStyles.buttontext1,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/confirm',(route) => false);
                },
              ),
            ),
            SizedBox(height: 40),
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

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {

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
            // SizedBox(height: 40),
            // Row(
            //   children: [
            //     SvgPicture.asset('assets/logosmall.svg'),
            //     SizedBox(width: 10),
            //     Text('OneLook',
            //         style: TextStyles.withColor(textcolor: AppColors.deepblue)
            //             .headline1),
            //   ],
            // ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Center(child: SvgPicture.asset('assets/login_sign/password.svg')),
            SizedBox(height: 40),
            Center(
              child: Text("Your password has been changed",
                  style: TextStyles.withColor(textcolor: AppColors.deepblue)
                      .headline2,textAlign: TextAlign.center,),
            ),
            Spacer(),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'Log in',
                buttonStyle: ButtonStyles.buttonprimary,
                textStyle: TextStyles.buttontext1,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/navbar', (route) => false);
                },
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
