import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/data/models/supplement_model.dart';
import 'package:onelook/data/repository/auth_repository.dart';
import 'package:onelook/data/repository/supplement_repository.dart';

class AddSupplementController extends GetxController {
  final SupplementRepository _repo = SupplementRepository();
  final textController = TextEditingController();

  // Supplement Info
  final selectedFormIndex = 0.obs;
  final selectedDosageTimes = 1.obs;
  final selectedDosageAmount = 1.obs;

  // Dropdown Selections
  final selectedFrequency = ''.obs;
  final selectedDuration = ''.obs;

  // Meal Option
  final selectedMealOption = ''.obs;

  // Reminder Toggles
  final isReminderBeforeTimeChecked = false.obs;
  final isReminderAfterTimeChecked = false.obs;

  // Time of Day Selection
  final timesOfDay = [
    {"icon": "sunrise", "label": "Morning"},
    {"icon": "afternoon", "label": "Afternoon"},
    {"icon": "sunset", "label": "Evening"},
    {"icon": "night", "label": "Night"},
  ];
  final times = [
    {"label": "Morning", "time": "8:00 AM"},
    {"label": "Afternoon", "time": "12:00 PM"},
    {"label": "Evening", "time": "4:00 PM"},
    {"label": "Night", "time": "8:00 PM"},
  ];

  final selectedTimeOptions = <RxString>[].obs;
  final isCustomTimeSelected = <RxBool>[].obs;
  final customTimeDisplayList = <String>[].obs;

  // Supplement Forms
  final supplementForms = [
    {"icon": "pill", "label": "pill"},
    {"icon": "tablet", "label": "tablet"},
    {"icon": "sachet", "label": "sachet"},
    {"icon": "drops", "label": "drops"},
    {"icon": "spoon", "label": "spoon"},
  ];

  final frequencyOptions = [
    'Everyday',
    'Weekdays',
    'Every other day',
    'Weekends'
  ];

  final durationOptions = [
    '3 days',
    '7 days',
    '14 days',
    '30 days',
    '60 days',
    '90 days',
    // 'Ongoing Use',
    // 'Indefinite',
    'Custom...'
  ];

  final mealOptions = [
    "Before meal",
    "After meal",
    "With meal",
    "During meal",
    "No meal",
  ];

  // Custom Time Picker Temporaries
  final customHour = 0.obs;
  final customMinute = 0.obs;

  @override
  void onInit() {
    super.onInit();
    selectedFrequency.value = frequencyOptions[0];
    selectedDuration.value = durationOptions[0];
    selectedMealOption.value = 'Before meal';
    _initializeSelections(1); // Default: 1 dosage time
  }

  void _initializeSelections(int count) {
    selectedTimeOptions.value = List.generate(count, (_) => ''.obs);
    isCustomTimeSelected.value = List.generate(count, (_) => false.obs);
    customTimeDisplayList.value = List.generate(count, (_) => "Add Custom Time");
  }

  /// Handles preset time slot selection
  void setPresetTime(int index, String label) {
    selectedTimeOptions[index].value = label;
    isCustomTimeSelected[index].value = false;
  }

  /// Handles custom time selection
  void setCustomTime(int index, String label) {
    selectedTimeOptions[index].value = label;
    isCustomTimeSelected[index].value = true;
    customTimeDisplayList[index] = label;
  }

  /// Handles dosage times update (when user taps selector)
  void updateDosageCount(int count) {
    selectedDosageTimes.value = count;
    _initializeSelections(count);
  }

  /// Handles 'Custom...' duration input
  void updateDuration(BuildContext context, String value) {
    if (value == 'Custom...') {
      showDialog(
        context: context,
        builder: (_) {
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
  //need to correct this logic//
  int _parseDuration(String value) {
  final regex = RegExp(r'\d+');
  final match = regex.firstMatch(value);
  if (match != null) {
    return int.tryParse(match.group(0) ?? '') ?? 30;
  }
  // For 'Ongoing Use' or 'Indefinite', fallback to default
  return 30;
}

  /// Final submission method (you can later convert this to send model to backend)
  void submitSupplement() async {
  final name = textController.text.trim();

  // Validation
  if (name.isEmpty ||
      selectedFormIndex.value < 0 ||
      selectedDosageTimes.value < 1 ||
      selectedDosageAmount.value < 1 ||
      selectedMealOption.value.isEmpty ||
      selectedTimeOptions.any((rx) => rx.value.isEmpty)) {
    Get.snackbar("Missing Info", "Please fill all required fields.");
    return;
  }

  final int durationDays = _parseDuration(selectedDuration.value);

  // Build timeOfDay from reactive strings
  final List<String> timeSlots =
      selectedTimeOptions.map((rx) => rx.value).toList();

  // Initialize tracking: duration days x dosageTimes
  final tracking = List.generate(durationDays, (_) {
    return {
      for (int i = 0; i < selectedDosageTimes.value; i++) 'dose_$i': false,
    };
  });


  final model = SupplementModel(
    name: name,
    form: supplementForms[selectedFormIndex.value]["label"]!,
    dosageAmount: selectedDosageAmount.value,
    dosageTimes: selectedDosageTimes.value,
    frequency: selectedFrequency.value,
    duration: durationDays,
    meal: selectedMealOption.value,
    timeOfDay: timeSlots,
    reminderBefore: isReminderBeforeTimeChecked.value,
    reminderAfter: isReminderAfterTimeChecked.value,
    tracking: tracking,
    createdAt: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: durationDays)),
  );

  try {
    final userId = Get.find<AuthRepository>().currentUserId;

    if (userId != null) {
      await _repo.addSupplement(userId, model);
      Get.back();
      Get.snackbar("Success", "Supplement added");
    } else {
      Get.snackbar("Error", "No user logged in.");
    }
  } catch (e) {
    log(e.toString());
    Get.snackbar("Error", "Failed to add supplement: $e");
  }
}

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}