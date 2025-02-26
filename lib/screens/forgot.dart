import 'package:flutter/material.dart';
import 'package:onelook/components/button.dart';
import 'package:onelook/components/elevated_button.dart';
import 'package:onelook/components/widgets/text_field.dart';

import '../components/text.dart';
import '../constants/app_color.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
                child: Text("Enter your e-mail",
                    style: TextStyles.withColor(textcolor: AppColors.deepblue)
                        .headline1)),
            SizedBox(height: 20),
            Text('You will receive a link to confirm the password change to the e-mail address provided', style: TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext2,textAlign: TextAlign.center,),
            SizedBox(height: 20),
            AuthTextField(
              label: 'E-mail',
              hint: 'Enter your e-mail here',
              icon: 'assets/login_sign/email.png',
            ),
            Spacer(),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'Confirm e-mail',
                buttonStyle: ButtonStyles.buttonprimary,
                textStyle: TextStyles.buttontext1,
                onPressed: () {
                  Navigator.pushNamed(context, '/newpassword');
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
