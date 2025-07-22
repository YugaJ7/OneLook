import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/button.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/buttons/outlined_button.dart';
import 'package:onelook/components/widgets/card/stats_card.dart';
import 'package:onelook/components/widgets/card/supplement_task.dart';
import 'package:onelook/constants/app_color.dart';
import 'package:onelook/controllers/home/home.dart';
import 'package:onelook/data/models/today_dose_item.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController controller = Get.find();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> stats = [
      {
        'title': 'Breath Rate',
        'rate': '12 BrPM',
        'icon': 'assets/icons/stats_breath.png',
        'color': AppColors.violetLight,
      },
      {
        'title': 'Heart Rate',
        'rate': '72 BPM',
        'icon': 'assets/icons/stats_heart.png',
        'color': AppColors.waterLight,
      },
      {
        'title': 'Blood Pressure',
        'rate': '120/80 mmHg',
        'icon': 'assets/icons/stats_blood.png',
        'color': AppColors.peachLight,
      },
      {
        'title': 'ECG',
        'rate': '120/80 mmHg',
        'icon': 'assets/icons/stats_ecg.png',
        'color': AppColors.sunnyYellowLight,
      },
      {
        'title': 'Body Temperature',
        'rate': '37 °C',
        'icon': 'assets/icons/stats_temp.png',
        'color': AppColors.babyBlueLight,
      },
    ];

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
                  Text('Hi ${controller.userController.userName}!',
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
            SizedBox(
              height:
                  screenHeight * 0.18, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                    left: screenWidth * 0.06, right: screenWidth * 0.06),
                itemCount: stats.length,
                itemBuilder: (context, index) {
                  final stat = stats[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        right:
                            index == stats.length - 1 ? 0 : screenWidth * 0.04),
                    child: StatsCard(
                      title: stat['title'],
                      rate: stat['rate'],
                      onPressed: () {}, 
                      icon: stat['icon'],
                      color: stat['color'],
                    ),
                  );
                },
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
                                            onPressed: () =>
                                                Get.offNamed('/add_activity'),
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
                                            onPressed: () =>
                                                Get.offNamed('/add_supplement'),
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
                  Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero, 
                      itemCount: controller.todayDoses.length,
                      itemBuilder: (context, index) {
                        final TodayDoseItem supplement = controller.todayDoses[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: SupplementTaskCard(
                            title: supplement.name,
                            subtitle: '${supplement.amount} ${supplement.form} ${supplement.meal.toLowerCase()} at ${supplement.time}',
                            icon: supplement.form,
                            isChecked: supplement.isChecked,
                            onChecked: () {
                              controller.toggleDoseCheck(
                                docId: supplement.docId,
                                dayIndex: supplement.dayIndex,
                                doseIndex: supplement.doseIndex,
                              );
                            },
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
