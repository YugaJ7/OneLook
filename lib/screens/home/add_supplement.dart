import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/button.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/buttons/elevated_button.dart';
import 'package:onelook/components/widgets/buttons/outlined_button.dart';
import 'package:onelook/components/widgets/dropdown/dropdown.dart';
import 'package:onelook/components/widgets/textfield/text_field.dart';
import 'package:onelook/constants/app_color.dart';
import 'package:onelook/controllers/add_supplement.dart';

class AddSupplementScreen extends StatelessWidget {
  final AddSupplementController controller = Get.find();
  AddSupplementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final supplementForm = [
      {"icon": "pill", "label": "Pill"},
      {"icon": "tablet", "label": "Tablet"},
      {"icon": "sachet", "label": "Sachet"},
      {"icon": "drops", "label": "Drops"},
      {"icon": "spoon", "label": "Spoon"},
    ];
    final time = [
      {"icon": "sunrise", "label": "Morning"},
      {"icon": "afternoon", "label": "Afternoon"},
      {"icon": "sunset", "label": "Evening"},
      {"icon": "night", "label": "Night"},
    ];
    final meal = [
      {"label": "Before meal"},
      {"label": "After meal"},
      {"label": "With meal"},
      {"label": "During meal"},
      {"label": "No meal"},
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(
                          'assets/icons/close.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.014),
                    Center(
                      child: Text(
                        "Add Supplement",
                        style:
                            TextStyles.withColor(textcolor: AppColors.deepBlue)
                                .headline1,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.024),
                    Text(
                      "Supplement Name",
                      style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                          .headline3,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hint: "Type name of the supplement",
                      controller: controller.textController,
                    ),
                    SizedBox(height: screenHeight * 0.022),
                    Divider(color: AppColors.lightGrey, thickness: 1.5),
                    SizedBox(height: screenHeight * 0.022),
                    Text(
                      "Supplement Form",
                      style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                          .headline3,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              SizedBox(
                height: 92,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.06, right: screenWidth * 0.06),
                  itemCount: supplementForm.length,
                  itemBuilder: (context, index) {
                    final form = supplementForm[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == supplementForm.length - 1 ? 0 : 16),
                      child: _formOption(
                        form["icon"]!,
                        form["label"]!,
                        selected: index ==
                            0, // optionally make the first one selected
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.022),
                    Divider(color: AppColors.lightGrey, thickness: 1.5),
                    SizedBox(height: screenHeight * 0.022),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Dosage ",
                            style: TextStyles.withColor(
                                    textcolor: AppColors.deepBlue)
                                .headline3,
                          ),
                          TextSpan(
                              text: "(Times a day)",
                              style: TextStyles.withColor(
                                      textcolor: AppColors.darkGrey)
                                  .bodytext3),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.06, right: screenWidth * 0.06),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    bool selected = index == 0;
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == 9 ? 0 : screenWidth * 0.025),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.lilacPetalsDark,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: selected
                                    ? AppColors.purplePlum
                                    : AppColors.lilacPetalsDark),
                          ),
                          child: Center(
                            child: Text("${index + 1}",
                                style: TextStyles.withColor(
                                        textcolor: selected
                                            ? AppColors.deepBlue
                                            : AppColors.darkGrey)
                                    .headline3),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.022),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Dosage ",
                        style:
                            TextStyles.withColor(textcolor: AppColors.deepBlue)
                                .headline3,
                      ),
                      TextSpan(
                          text: "(per Inatake)",
                          style: TextStyles.withColor(
                                  textcolor: AppColors.darkGrey)
                              .bodytext3),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: screenHeight * 0.05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.06, right: screenWidth * 0.06),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    bool selected = index == 0;
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == 9 ? 0 : screenWidth * 0.025),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.lilacPetalsDark,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: selected
                                    ? AppColors.purplePlum
                                    : AppColors.lilacPetalsDark),
                          ),
                          child: Center(
                            child: Text("${index + 1}",
                                style: TextStyles.withColor(
                                        textcolor: selected
                                            ? AppColors.deepBlue
                                            : AppColors.darkGrey)
                                    .headline3),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.022),
                    Divider(color: AppColors.lightGrey, thickness: 1.5),
                    SizedBox(height: screenHeight * 0.022),
                    Text("Frequency",
                        style:
                            TextStyles.withColor(textcolor: AppColors.deepBlue)
                                .headline3),
                    const SizedBox(height: 8),
                    // FlatStyledDropdown(
                    //   options: [
                    //     'Everyday',
                    //     'Weekdays',
                    //     'Every other day',
                    //     'Weekends'
                    //   ],
                    //   initialValue: 'Everyday',
                    //   onChanged: (val) {
                    //     print('Selected: $val');
                    //   },
                    // ),
                    FinalDropdown(),
                    SizedBox(height: screenHeight * 0.022),
                    Text("Duration",
                        style:
                            TextStyles.withColor(textcolor: AppColors.deepBlue)
                                .headline3),
                    const SizedBox(height: 8),
                    FinalDropdown(),
                    SizedBox(height: screenHeight * 0.022),
                    Text("Time of day",
                        style:
                            TextStyles.withColor(textcolor: AppColors.deepBlue)
                                .headline3),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              SizedBox(
                height: 92,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.06, right: screenWidth * 0.06),
                  itemCount: time.length,
                  itemBuilder: (context, index) {
                    final form = time[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == time.length - 1 ? 0 : 16),
                      child: _formOption(
                        form["icon"]!,
                        form["label"]!,
                        selected: index == 0,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.018),
                    CustomOutlinedButton(
                        text: "Add custom time",
                        onPressed: () {},
                        textStyle: TextStyles.buttontext2,
                        buttonStyle: ButtonStyles.smallprimary),
                    SizedBox(height: screenHeight * 0.022),
                    Divider(color: AppColors.lightGrey, thickness: 1.5),
                    SizedBox(height: screenHeight * 0.022),
                    Text("Taking with meals",
                        style:
                            TextStyles.withColor(textcolor: AppColors.deepBlue)
                                .headline3),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                    left: screenWidth * 0.06, right: screenWidth * 0.06),
                child: Row(
                  children: List.generate(meal.length, (index) {
                    final form = meal[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == meal.length - 1 ? 0 : 16),
                      child: _mealOption(
                        form["label"]!,
                        selected: index == 0,
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.044),
                    Text(
                      "Set Reminder",
                      style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                          .headline2,
                    ),
                    const SizedBox(height: 8),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Before the scheduled time",
                                style: TextStyles.withColor(
                                        textcolor: AppColors.deepBlue)
                                    .headline3),
                            GestureDetector(
                              onTap: () => controller
                                  .isReminderBeforeTimeChecked
                                  .toggle(),
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.5,
                                    color:AppColors.dustGrey,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: controller
                                          .isReminderBeforeTimeChecked.value
                                      ? AppColors.turquoise
                                      : AppColors.lilacPetalsDark,
                                  child: Icon(
                                    controller.isReminderBeforeTimeChecked.value
                                        ? Icons.check
                                        : null,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(color: AppColors.lightGrey, thickness: 1.5),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Before the scheduled time",
                                style: TextStyles.withColor(
                                        textcolor: AppColors.deepBlue)
                                    .headline3),
                            GestureDetector(
                              onTap: () => controller.isReminderAfterTimeChecked
                                  .toggle(),
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.5,
                                    color:AppColors.dustGrey,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: controller
                                          .isReminderAfterTimeChecked.value
                                      ? AppColors.turquoise
                                      : AppColors.lilacPetalsDark,
                                  child: Icon(
                                    controller.isReminderAfterTimeChecked.value
                                        ? Icons.check
                                        : null,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(color: AppColors.lightGrey, thickness: 1.5),
                    SizedBox(height: screenHeight * 0.022),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        text: 'Add Supplement',
                        buttonStyle: ButtonStyles.buttonprimary,
                        textStyle: TextStyles.buttontext1,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _formOption(String icon, String label, {bool selected = false}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.lilacPetalsDark,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color:
                  selected ? AppColors.purplePlum : AppColors.lilacPetalsDark),
        ),
        child: Center(
          child: Image.asset(
            'assets/icons/$icon.png',
            width: 32,
            height: 32,
            color: selected ? AppColors.deepBlue : AppColors.darkGrey,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: TextStyles.buttontext2.copyWith(
            color: selected ? AppColors.deepBlue : AppColors.darkGrey),
      ),
    ],
  );
}

Widget _mealOption(String label, {bool selected = false}) => Container(
      decoration: BoxDecoration(
        color: AppColors.lilacPetalsDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: selected ? AppColors.purplePlum : AppColors.lilacPetalsDark),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          label,
          style: TextStyles.buttontext2.copyWith(
              color: selected ? AppColors.deepBlue : AppColors.darkGrey),
        ),
      ),
    );