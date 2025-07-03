import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/dropdown/dropdown.dart';
import 'package:onelook/components/widgets/dropdown/freq_dropdown.dart';
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
    final supplementForms = [
      {"icon": "pill", "label": "Pill"},
      {"icon": "tablet", "label": "Tablet"},
      {"icon": "sachet", "label": "Sachet"},
      {"icon": "drops", "label": "Drops"},
      {"icon": "spoon", "label": "Spoon"},
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
                  itemCount: supplementForms.length,
                  itemBuilder: (context, index) {
                    final form = supplementForms[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == supplementForms.length - 1 ? 0 : 16),
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
                    FlatStyledDropdown(
                      options: [
                        'Everyday',
                        'Weekdays',
                        'Every other day',
                        'Weekends'
                      ],
                      initialValue: 'Everyday',
                      onChanged: (val) {
                        print('Selected: $val');
                      },
                    ),
                    SizedBox(height: screenHeight * 0.022),
                    Text("Duration",
                        style:
                            TextStyles.withColor(textcolor: AppColors.deepBlue)
                                .headline3),
                    const SizedBox(height: 8),
                    //_dropdown("30 days"),
                    FinalDropdown(),
                  ],
                ),
              ),
              //continue from here

              
              const SizedBox(height: 32),
              const Text("Time of day",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F2851))),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                children: [
                  _timeOption("sunrise", "Morning", selected: true),
                  _timeOption("sun", "Afternoon"),
                  _timeOption("sunset", "Evening"),
                  _timeOption("moon", "Night"),
                ],
              ),
              const SizedBox(height: 12),
              _textButton("Add custom time"),
              const SizedBox(height: 32),
              const Text("Taking with meals",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F2851))),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                children: [
                  _mealOption("Before meal", selected: true),
                  _mealOption("After meal"),
                  _mealOption("During the meal"),
                ],
              ),
              const SizedBox(height: 32),
              const Text("Set Reminder",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F2851))),
              const SizedBox(height: 16),
              _reminderTile("Before the scheduled time"),
              const SizedBox(height: 16),
              _reminderTile("After exceeding the time"),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF585CE5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Add Supplement",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
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

Widget _timeOption(String icon, String label, {bool selected = false}) {
  return OutlinedButton.icon(
    onPressed: () {},
    icon: Text(icon),
    label: Text(label),
    style: OutlinedButton.styleFrom(
      backgroundColor: selected ? Color(0xFF585CE5).withOpacity(0.1) : null,
      side: BorderSide(color: Color(0xFF585CE5)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

Widget _textButton(String text) => TextButton(
      onPressed: () {},
      child: Text(text, style: TextStyle(color: Color(0xFF585CE5))),
    );

Widget _mealOption(String label, {bool selected = false}) => OutlinedButton(
      onPressed: () {},
      child: Text(label),
      style: OutlinedButton.styleFrom(
        backgroundColor: selected ? Color(0xFF585CE5).withOpacity(0.1) : null,
        side: BorderSide(color: Color(0xFF585CE5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

Widget _reminderTile(String title) => Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFF5F6FA),
        border: Border.all(color: Color(0xFFE5E6EE)),
      ),
      child: Row(
        children: [
          Icon(Icons.alarm, color: Color(0xFF585CE5)),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
          Switch(value: true, onChanged: (_) {}),
        ],
      ),
    );
