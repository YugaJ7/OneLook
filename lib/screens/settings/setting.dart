import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/common/menu_option.dart';
import 'package:onelook/constants/app_color.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.lilacPetals,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: SingleChildScrollView(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: screenHeight * 0.022),
                Text(
                  'Settings',
                  style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline2,
                ),
                SizedBox(height: screenHeight * 0.022),
                MenuOption(
                  text: 'Activity Manager',
                  textStyle: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3,
                  prefixIcon: 'assets/settings/manager.png',
                  onTap: () => Get.toNamed('/activity_manager'),
                ),
                MenuOption(
                  text: 'Notification Stettings',
                  textStyle: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3,
                  prefixIcon: 'assets/settings/notification.png',
                  onTap: () {},
                ),
                MenuOption(
                  text: 'Personal Data',
                  textStyle: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3,
                  prefixIcon: 'assets/settings/user.png',
                  onTap: () {},
                ),
                MenuOption(
                  text: 'Support',
                  textStyle: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3,
                  prefixIcon: 'assets/settings/support.png',
                  suffixIcon: 'assets/settings/link.png',
                  onTap: () {},
                ),
                MenuOption(
                  text: 'Contact Us',
                  textStyle: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3,
                  prefixIcon: 'assets/settings/contact.png',
                  onTap: () {},
                ),
                MenuOption(
                  text: 'Privacy Policy',
                  textStyle: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3,
                  prefixIcon: 'assets/settings/policy.png',
                  suffixIcon: 'assets/settings/link.png',
                  onTap: () {},
                ),
              ]),
            ),
          ),
        ));
  }
}
