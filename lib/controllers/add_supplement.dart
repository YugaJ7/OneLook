import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/data/models/supplement_model.dart';
import 'package:onelook/data/repository/auth_repository.dart';
import 'package:onelook/data/repository/supplement_repository.dart';

class AddSupplementController extends GetxController {
  final _repo = SupplementRepository();
  final textController = TextEditingController();
  var text = ''.obs;

  final isReminderBeforeTimeChecked = false.obs;
  final isReminderAfterTimeChecked = false.obs;

  final selectedFormIndex = (-1).obs; 
  final selectedDosageTimes = (-1).obs;
  final selectedDosageAmount = (-1).obs;
  final selectedFrequency = 'Everyday'.obs;
  final selectedDuration = '3 days'.obs;
  final selectedMealOption = ''.obs;
  final selectedTimeOption = ''.obs;
  final isCustomTimeSelected = false.obs; 

  final customHour = 0.obs;
  final customMinute = 0.obs;

  final durationHour = 0.obs;
  final durationMinute = 0.obs;

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

String get customTimeFormatted {
    final h = customHour.value.toString().padLeft(2, '0');
    final m = customMinute.value.toString().padLeft(2, '0');
    return "$h:$m";
  }

  String get customTimeDisplay {
    final h = customHour.value;
    final m = customMinute.value;
    final isAm = h < 12;
    final formattedHour =
        (h % 12 == 0 ? 12 : h % 12).toString().padLeft(2, '0');
    final formattedMinute = m.toString().padLeft(2, '0');
    return "$formattedHour:$formattedMinute ${isAm ? 'AM' : 'PM'}";
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

  void submitSupplement() async {
    if (text.value.isEmpty ||
    selectedFormIndex.value < 0 ||
        selectedDosageTimes.value<1 ||
        selectedDosageAmount.value<1 ||
        selectedMealOption.value.isEmpty ||
        selectedTimeOption.value.isEmpty) {
      Get.snackbar("Missing Info", "Please fill all required fields.");
      return;
    }

    final model = SupplementModel(
      name: text.value,
      form: supplementForms[selectedFormIndex.value]["label"]!,
      dosageTimes: selectedDosageTimes.value,
      dosageAmount: selectedDosageAmount.value,
      frequency: selectedFrequency.value,
      duration: selectedDuration.value,
      timeOfDay: selectedTimeOption.value,
      customTime: customTimeFormatted,
      meal: selectedMealOption.value,
      reminderBefore: isReminderBeforeTimeChecked.value,
      reminderAfter: isReminderAfterTimeChecked.value,
      createdAt: DateTime.now(),
    );

    try {
      final userId = Get.find<AuthRepository>().currentUserId;
      if (userId != null) {
        await _repo.addSupplement(userId, model);
        Get.back();
        Get.snackbar("Success", "Supplement added");
      } else {
        Get.snackbar("Error", "No user found.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to add: $e");
    }
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}