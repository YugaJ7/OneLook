import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/button.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/buttons/elevated_button.dart';
import 'package:onelook/components/widgets/buttons/outlined_button.dart';
import 'package:onelook/components/widgets/common/circle_selector.dart';
import 'package:onelook/components/widgets/common/form_option_tile.dart';
import 'package:onelook/components/widgets/common/meal_option_tile.dart';
import 'package:onelook/components/widgets/common/reminder_toggle_row.dart';
import 'package:onelook/components/widgets/dropdown/dropdown.dart';
import 'package:onelook/components/widgets/textfield/text_field.dart';
import 'package:onelook/constants/app_color.dart';
import 'package:onelook/controllers/add_supplement.dart';

class AddSupplementScreen extends StatelessWidget {
  final AddSupplementController controller = Get.find();

  AddSupplementScreen({super.key});

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
                      child: Text("Add Supplement",
                          style: TextStyles.withColor(
                                  textcolor: AppColors.deepBlue)
                              .headline1),
                    ),
                    sectionSpacing(height),
                    sectionTitle("Supplement Name"),
                    CustomTextField(
                      hint: "Type name of the supplement",
                      controller: controller.textController,
                    ),
                    sectionSpacing(height),
                    Divider(
                      color: AppColors.lightGrey,
                      thickness: 1,
                    ),
                    sectionSpacing(height),
                    sectionTitle("Supplement Form"),
                  ],
                ),
              ),
              SizedBox(
                height: 92,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                  itemCount: controller.supplementForms.length,
                  itemBuilder: (_, index) {
                    final item = controller.supplementForms[index];
                    return Obx(() => FormOptionTile(
                          icon: item['icon']!,
                          label: item['label']!,
                          selected: controller.selectedFormIndex.value == index,
                          onTap: () =>
                              controller.selectedFormIndex.value = index,
                        ));
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionSpacing(height),
                    Divider(
                      color: AppColors.lightGrey,
                      thickness: 1,
                    ),
                    sectionSpacing(height),
                    sectionTitleRich("Dosage ", "(Times a day)"),
                  ],
                ),
              ),
              Obx(() => CircleSelector(
                    selectedIndex: controller.selectedDosageTimes.value - 1,
                    onSelect: (i) =>
                        controller.selectedDosageTimes.value = i + 1,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionSpacing(height),
                    sectionTitleRich("Dosage ", "(per intake)"),
                  ],
                ),
              ),
              Obx(() => CircleSelector(
                    selectedIndex: controller.selectedDosageAmount.value - 1,
                    onSelect: (i) =>
                        controller.selectedDosageAmount.value = i + 1,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionSpacing(height),
                    Divider(
                      color: AppColors.lightGrey,
                      thickness: 1,
                    ),
                    sectionSpacing(height),
                    sectionTitle("Frequency"),
                    CustomDropdown(
                      label: "Frequency",
                      options: controller.frequencyOptions,
                      selected: controller.selectedFrequency,
                    ),
                    sectionSpacing(height),
                    sectionTitle("Duration"),
                    CustomDropdown(
                      label: "Duration",
                      options: controller.durationOptions,
                      selected: controller.selectedDuration,
                      onChanged: (val) =>
                          controller.updateDuration(context, val),
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
                              onTap: () => controller.selectedTimeOption.value =
                                  item['label']!,
                            );
                          });
                        },
                        separatorBuilder: (_, __) => const SizedBox(width: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(() => CustomOutlinedButton(
                          text: controller
                                      .selectedTimeOption.value.isNotEmpty &&
                                  !controller.timesOfDay
                                      .map((t) => t['label'])
                                      .contains(
                                          controller.selectedTimeOption.value)
                              ? controller.selectedTimeOption.value
                              : "Add custom time",
                          onPressed: controller.showCustomTimePicker,
                          textStyle: TextStyles.buttontext2,
                          buttonStyle: ButtonStyles.smallprimary,
                        )),
                    sectionSpacing(height),
                    Divider(
                      color: AppColors.lightGrey,
                      thickness: 1,
                    ),
                    sectionSpacing(height),
                    sectionTitle("Taking with meals"),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Row(
                        children: controller.mealOptions.map((label) {
                          final isSelected =
                              controller.selectedMealOption.value == label;
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: MealOptionTile(
                              label: label,
                              selected: isSelected,
                              onTap: () =>
                                  controller.selectedMealOption.value = label,
                            ),
                          );
                        }).toList(),
                      ),
                    )),
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
                        text: 'Add Supplement',
                        buttonStyle: ButtonStyles.buttonprimary,
                        textStyle: TextStyles.buttontext1,
                        onPressed: controller.submitSupplement,
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
