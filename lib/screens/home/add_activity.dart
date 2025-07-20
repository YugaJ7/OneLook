import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/button.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/bottomsheet/time_sheet.dart';
import 'package:onelook/components/widgets/buttons/elevated_button.dart';
import 'package:onelook/components/widgets/buttons/outlined_button.dart';
import 'package:onelook/components/widgets/common/activity_option_tile.dart';
import 'package:onelook/components/widgets/common/duration_picker.dart';
import 'package:onelook/components/widgets/common/form_option_tile.dart';
import 'package:onelook/components/widgets/common/reminder_toggle_row.dart';
import 'package:onelook/constants/app_color.dart';
import 'package:onelook/controllers/add_activity.dart';

class AddActivityScreen extends StatelessWidget {
  final AddActivityController controller = Get.find();

  AddActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Image.asset('assets/icons/close.png',
                            width: 40, height: 40),
                      ),
                    ),
                    SizedBox(height: height * 0.017),
                    Center(
                      child: Text("Add Activity",
                          style: TextStyles.withColor(
                                  textcolor: AppColors.deepBlue)
                              .headline1),
                    ),
                    sectionSpacing(height),
                    sectionTitle("Choose the type of activity"),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = constraints.maxWidth;
                        // Set how many tiles per row you want to allow
                        int crossAxisCount = ((screenWidth) / (82)).floor();

                        // Total horizontal spacing = (crossAxisCount - 1) gaps
                        double spacing = 16;
                        double totalSpacing = spacing * (crossAxisCount - 1);

                        // Calculate tile width
                        double tileWidth =
                            (screenWidth - totalSpacing) / crossAxisCount;

                        return Wrap(
                          spacing: spacing,
                          runSpacing: 24,
                          children: List.generate(
                            controller.activity.length,
                            (index) {
                              final item = controller.activity[index];
                              return Obx(() => SizedBox(
                                    width: tileWidth,
                                    child: ActivityOptionTile(
                                      icon: item['icon']!,
                                      label: item['label']!,
                                      selected:
                                          controller.selectedFormIndex.value ==
                                              index,
                                      onTap: () => controller
                                          .selectedFormIndex.value = index,
                                    ),
                                  ));
                            },
                          ),
                        );
                      },
                    ),
                    sectionSpacing(height),
                    Divider(
                      color: AppColors.lightGrey,
                      thickness: 1,
                    ),
                    sectionSpacing(height),
                    sectionTitle("Time of Day"),
                    SizedBox(
                      height: 92,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.timesOfDay.length,
                        itemBuilder: (_, index) {
                          final item = controller.timesOfDay[index];
                          return Obx(() {
                            final isSelected =
                                controller.selectedTimeOption.value ==
                                    item['label'];
                            return FormOptionTile(
                              icon: item['icon']!,
                              label: item['label']!,
                              selected: isSelected,
                              onTap: () {
                                controller.selectedTimeOption.value =
                                    item['label']!;
                                controller.isCustomTimeSelected.value = false;
                              },
                            );
                          });
                        },
                        separatorBuilder: (_, __) => const SizedBox(width: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(() => CustomOutlinedButton(
                          text: controller.isCustomTimeSelected.value
                              ? controller.customTimeDisplay
                              : "Add Custom Time",
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (_) => CustomTimeBottomSheet(
  customHour: controller.customHour,
  customMinute: controller.customMinute,
  isCustomTimeSelected: controller.isCustomTimeSelected,
  selectedTimeOption: controller.selectedTimeOption,
),

                            );
                          },
                          textStyle: TextStyles.buttontext2,
                          buttonStyle: ButtonStyles.smallprimary,
                        )),
                    sectionSpacing(height),
                    Divider(
                      color: AppColors.lightGrey,
                      thickness: 1,
                    ),
                    sectionSpacing(height),
                    sectionTitleRich("Activity duration ", "(hours/minutes)"),
                    Obx(() => DurationPicker(
                          initialHour: controller.durationHour.value,
                          initialMinute: controller.durationMinute.value,
                          onChanged: (h, m) {
                            controller.durationHour.value = h;
                            controller.durationMinute.value = m;
                          },
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionSpacing(height),
                    sectionSpacing(height),
                    Text("Set Reminder",
                        style:
                            TextStyles.withColor(textcolor: AppColors.deepBlue)
                                .headline2),
                    SizedBox(height: 8),
                    ReminderToggleRow(
                      label: "Before the scheduled time",
                      value: controller.isReminderBeforeTimeChecked,
                    ),
                    Divider(
                      color: AppColors.lightGrey,
                      thickness: 1,
                    ),
                    ReminderToggleRow(
                      label: "After the scheduled time",
                      value: controller.isReminderAfterTimeChecked,
                    ),
                    Divider(
                      color: AppColors.lightGrey,
                      thickness: 1,
                    ),
                    sectionSpacing(height),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        text: 'Add Activity',
                        buttonStyle: ButtonStyles.buttonprimary,
                        textStyle: TextStyles.buttontext1,
                        onPressed: controller.submitActivity,
                      ),
                    ),
                    sectionSpacing(height),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          title,
          style: TextStyles.withColor(textcolor: AppColors.deepBlue).headline3,
        ),
      );

  Widget sectionTitleRich(String title, String subtitle) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3),
              TextSpan(
                  text: subtitle,
                  style: TextStyles.withColor(textcolor: AppColors.darkGrey)
                      .bodytext3),
            ],
          ),
        ),
      );

  Widget sectionSpacing(double height) => SizedBox(height: height * 0.022);
}
