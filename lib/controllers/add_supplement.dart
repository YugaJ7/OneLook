import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/widgets/common/duration_picker.dart';

class AddSupplementController extends GetxController {
  final textController = TextEditingController();
  var text = ''.obs;

  final isReminderBeforeTimeChecked = false.obs;
  final isReminderAfterTimeChecked = false.obs;

  final selectedFormIndex = (-1).obs; 
  final selectedDosageTimes = (-1).obs;
  final selectedDosageAmount = (-1).obs;
  final selectedMealOption = ''.obs;
  final selectedTimeOption = ''.obs; 

  final selectedFrequency = 'Everyday'.obs;
  final selectedDuration = '3 days'.obs;

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
    selectedMealOption.value = '';
    selectedTimeOption.value = '';
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

  String formatTime(int hour, int minute) {
    final time = TimeOfDay(hour: hour, minute: minute);
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return TimeOfDay.fromDateTime(dt).format(Get.context!);
  }

  void showCustomTimePicker() {
    int initialHour = 0;
    int initialMinute = 0;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text("Add Time", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DurationPicker(
              initialHour: initialHour,
              initialMinute: initialMinute,
              onChanged: (hour, minute) {
                selectedTimeOption.value = formatTime(hour, minute);
              },
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void submitSupplement() {
    final data = {
      "name": text.value,
      "form": selectedFormIndex.value >= 0
          ? supplementForms[selectedFormIndex.value]["label"]
          : null,
      "dosageTimes": selectedDosageTimes.value,
      "dosageAmount": selectedDosageAmount.value,
      "frequency": selectedFrequency.value,
      "duration": selectedDuration.value,
      "meal": selectedMealOption.value,
      "timeOfDay": selectedTimeOption.value,
      "reminderBefore": isReminderBeforeTimeChecked.value,
      "reminderAfter": isReminderAfterTimeChecked.value,
    };

    print("Collected Data: $data");
  }
}
