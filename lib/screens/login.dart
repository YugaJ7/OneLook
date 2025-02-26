import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onelook/components/button.dart';
import 'package:onelook/components/elevated_button.dart';
import 'package:onelook/components/widgets/social_button.dart';
import 'package:onelook/components/widgets/text_field.dart';

import '../components/text.dart';
import '../constants/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

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
            Row(
              children: [
                SvgPicture.asset('assets/logosmall.svg'),
                SizedBox(width: 10),
                Text('OneLook',
                    style: TextStyles.withColor(textcolor: AppColors.deepblue)
                        .headline1),
              ],
            ),
            SizedBox(height: 40),
            Center(
                child: Text("Welcome back",
                    style: TextStyles.withColor(textcolor: AppColors.deepblue)
                        .headline1)),
            SizedBox(height: 20),
            AuthTextField(
              label: 'E-mail',
              hint: 'Enter your e-mail here',
              icon: 'assets/login_sign/email.png',
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
            SizedBox(height: 20),
            Center(
                child: TextButton(onPressed: (){
                  Navigator.pushNamed(context, '/forgotpassword');
                }, child: Text('Forgot your password?',
                    style: TextStyles.withColor(textcolor: AppColors.purpleplum)
                        .bodytext3))),
            Spacer(),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'Log in',
                buttonStyle: ButtonStyles.buttonprimary,
                textStyle: TextStyles.buttontext1,
                onPressed: () {},
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
                SocialButton(assetPath: 'assets/login_sign/google.png'),
                SizedBox(width: 50),
                SocialButton(assetPath: 'assets/login_sign/facebook.png'),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account yet? ",
                    style: TextStyles.withColor(textcolor: AppColors.deepblue)
                        .bodytext3,
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyles.withColor(
                                textcolor: AppColors.purpleplum)
                            .bodytext3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
