import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/common/menu_option.dart';
import 'package:onelook/constants/app_color.dart';

class ActivityManagerScreen extends StatelessWidget {
  const ActivityManagerScreen({super.key});

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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back, color: AppColors.purplePlum,),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Activity Manager',
                      style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                          .headline2,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.022),
                MenuOption(
                  text: 'Activities',
                  textStyle: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3,
                  prefixIcon: 'assets/navbar/activity.png',
                  onTap: () {},
                ),
                MenuOption(
                  text: 'Supplements',
                  textStyle: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3,
                  prefixIcon: 'assets/settings/pills.png',
                  onTap: () {},
                ),
                MenuOption(
                  text: 'Goals',
                  textStyle: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3,
                  prefixIcon: 'assets/settings/goals.png',
                  onTap: () {},
                ),
              ]),
            ),
          ),
        ));
  }
}
