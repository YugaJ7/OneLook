import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSupplementController extends GetxController {
  final textController = TextEditingController();
  var text = ''.obs;

  final isReminderBeforeTimeChecked = false.obs;
  final isReminderAfterTimeChecked = false.obs;

  final selectedFormIndex = 0.obs;
  final selectedDosageTimes = 1.obs;
  final selectedDosageAmount = 1.obs;
  final selectedMealOption = ''.obs;
  final selectedTimeOption = ''.obs;

  final selectedFrequency = 'Everyday'.obs;
  final selectedDuration = '7 days'.obs;

  final supplementForms = [
    {"icon": "pill", "label": "Pill"},
    {"icon": "tablet", "label": "Tablet"},
    {"icon": "sachet", "label": "Sachet"},
    {"icon": "drops", "label": "Drops"},
    {"icon": "spoon", "label": "Spoon"},
  ];

  final timesOfDay = [
    {"icon": "sunrise", "label": "Morning"},
    {"icon": "afternoon", "label": "Afternoon"},
    {"icon": "sunset", "label": "Evening"},
    {"icon": "night", "label": "Night"},
  ];

  final mealOptions = [
    "Before meal",
    "After meal",
    "With meal",
    "During meal",
    "No meal",
  ];

  final frequencyOptions = [
    'Everyday',
    'Weekdays',
    'Every other day',
    'Weekends',
  ];

  final durationOptions = [
    '3 days',
    '7 days',
    '14 days',
    '30 days',
    '60 days',
    '90 days',
    'Ongoing Use',
    'Indefinite',
    'Custom...',
  ];

  @override
  void onInit() {
    textController.addListener(() {
      text.value = textController.text;
    });
    selectedMealOption.value = mealOptions.first;
    selectedTimeOption.value = timesOfDay.first["label"]!;
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void updateDuration(BuildContext context, String value) {
    if (value == 'Custom...') {
      showDialog(
        context: context,
        builder: (ctx) {
          final controller = TextEditingController();
          return AlertDialog(
            title: const Text("Enter Custom Duration (days)"),
            content: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "e.g. 120"),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    selectedDuration.value = "${controller.text} days";
                    Navigator.pop(context);
                  }
                },
                child: const Text("Save"),
              ),
            ],
          );
        },
      );
    } else {
      selectedDuration.value = value;
    }
  }

  void submitSupplement() {
    final data = {
      "name": text.value,
      "form": supplementForms[selectedFormIndex.value]["label"],
      "dosageTimes": selectedDosageTimes.value,
      "dosageAmount": selectedDosageAmount.value,
      "frequency": selectedFrequency.value,
      "duration": selectedDuration.value,
      "meal": selectedMealOption.value,
      "timeOfDay": selectedTimeOption.value,
      "reminderBefore": isReminderBeforeTimeChecked.value,
      "reminderAfter": isReminderAfterTimeChecked.value,
    };

    // TODO: Post this data to your backend API
    print("Collected Data: $data");
  }
}
