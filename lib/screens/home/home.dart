import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onelook/components/style/button.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/buttons/outlined_button.dart';
import 'package:onelook/components/widgets/card/stats_card.dart';
import 'package:onelook/constants/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.lilacPetals,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.044),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/logosmall.svg'),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: SvgPicture.asset('assets/notification.svg'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Hi Yuga!',
                      style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                          .headline1),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Health Stats',
                          style: TextStyles.withColor(
                                  textcolor: AppColors.deepBlue)
                              .headline2),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            // Health Stats Cards
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: screenWidth * 0.06),
              child: Row(
                children: [
                  StatsCard(
                    title: 'Breath Rate',
                    rate: '12 BrPM',
                    onPressed: () {},
                    icon: 'assets/icons/stats_breath.png',
                    color: AppColors.violetLight,
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  StatsCard(
                    title: 'Heart Rate',
                    rate: '72 BPM',
                    onPressed: () {},
                    icon: 'assets/icons/stats_heart.png',
                    color: AppColors.waterLight,
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  StatsCard(
                    title: 'Blood Pressure',
                    rate: '120/80 mmHg',
                    onPressed: () {},
                    icon: 'assets/icons/stats_blood.png',
                    color: AppColors.peachLight,
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  StatsCard(
                    title: 'ECG',
                    rate: '120/80 mmHg',
                    onPressed: () {},
                    icon: 'assets/icons/stats_ecg.png',
                    color: AppColors.sunnyYellowLight,
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  StatsCard(
                    title: 'Body Temperature',
                    rate: '37 °C',
                    onPressed: () {},
                    icon: 'assets/icons/stats_temp.png',
                    color: AppColors.babyBlueLight,
                  ),
                  SizedBox(width: screenWidth * 0.06),
                ],
              ),
            ),
            SizedBox(height: 16),
            // To Do List
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('To-Do List',
                          style: TextStyles.withColor(
                                  textcolor: AppColors.deepBlue)
                              .headline2),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierColor: AppColors.purplePlum.withAlpha(100),
                            barrierDismissible: true,
                            builder: (context) {
                              return Dialog(
                                shadowColor: AppColors.purplePlum,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                backgroundColor: Colors.white,
                                insetPadding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.06),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 40),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 8),
                                          Text(
                                            'Choose task category',
                                            style: TextStyles.withColor(
                                                    textcolor:
                                                        AppColors.deepBlue)
                                                .headline2,
                                          ),
                                          const SizedBox(height: 24),
                                          CustomOutlinedButton(
                                            text: 'Activity',
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            textStyle:
                                                TextStyles.buttontext1.copyWith(
                                              color: AppColors.purplePlum,
                                            ),
                                            buttonStyle: ButtonStyles
                                                .smallprimary
                                                .copyWith(
                                              minimumSize:
                                                  WidgetStateProperty.all(
                                                Size(double.infinity, 48),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          CustomOutlinedButton(
                                            text: 'Supplement',
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            textStyle:
                                                TextStyles.buttontext1.copyWith(
                                              color: AppColors.purplePlum,
                                            ),
                                            buttonStyle: ButtonStyles
                                                .smallprimary
                                                .copyWith(
                                              minimumSize:
                                                  WidgetStateProperty.all(
                                                Size(double.infinity, 48),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //Close Button
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Material(
                                        color: Colors.white,
                                        shape: const CircleBorder(),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          onTap: () => Navigator.pop(context),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Icon(Icons.close,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/add.svg'),
                            SizedBox(width: 8),
                            Text('Add Task',
                                style: TextStyles.withColor(
                                        textcolor: AppColors.purplePlum)
                                    .bodytext3),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
