import 'package:flutter/material.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/menu_option.dart';
import 'package:onelook/constants/app_color.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lilac,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight*0.044),
              Text(
                'Settings',
                style: TextStyles.withColor(textcolor: AppColors.deepblue).headline2,
              ),
              SizedBox(height: screenHeight*0.022),
              MenuOption(text: 'Activity Manager', textStyle: TextStyles.withColor(textcolor: AppColors.deepblue).headline3,prefixIcon: 'assets/settings/manager.png',),
              MenuOption(text: 'Notification Stettings', textStyle: TextStyles.withColor(textcolor: AppColors.deepblue).headline3,prefixIcon: 'assets/settings/notification.png',),
              MenuOption(text: 'Personal Data', textStyle: TextStyles.withColor(textcolor: AppColors.deepblue).headline3,prefixIcon: 'assets/settings/user.png',),
              MenuOption(text: 'Support', textStyle: TextStyles.withColor(textcolor: AppColors.deepblue).headline3,prefixIcon: 'assets/settings/support.png',suffixIcon: 'assets/settings/link.png',),
              MenuOption(text: 'Contact Us', textStyle: TextStyles.withColor(textcolor: AppColors.deepblue).headline3,prefixIcon: 'assets/settings/contact.png',),
              MenuOption(text: 'Privacy Policy', textStyle: TextStyles.withColor(textcolor: AppColors.deepblue).headline3,prefixIcon: 'assets/settings/policy.png',suffixIcon: 'assets/settings/link.png',),
            ]
            ),
        ),
      )
    );
  }
}