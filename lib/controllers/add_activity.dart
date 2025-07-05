import 'package:get/get.dart';

class AddActivityController extends GetxController {

  final isReminderBeforeTimeChecked = false.obs;
  final isReminderAfterTimeChecked = false.obs;

  final selectedFormIndex = 0.obs;
  final selectedTimeOption = ''.obs;

  final activity = [
    {"icon": "running", "label": "Running"},
    {"icon": "walking", "label": "Walking"},
    {"icon": "biking", "label": "Cycling"},
    {"icon": "fitness", "label": "Fitness"},
    {"icon": "yoga", "label": "Yoga"},
    {"icon": "exercise", "label": "Exercise"},
    {"icon": "rollers", "label": "Rollers"},
    {"icon": "breath", "label": "Breathing"},
    {"icon": "kcal", "label": "Spa"},
  ];

  final timesOfDay = [
    {"icon": "sunrise", "label": "Morning"},
    {"icon": "afternoon", "label": "Afternoon"},
    {"icon": "sunset", "label": "Evening"},
    {"icon": "night", "label": "Night"},
  ];



  void submitActivity() {
    final data = {
      "form": activity[selectedFormIndex.value]["label"],
      "timeOfDay": selectedTimeOption.value,
      "reminderBefore": isReminderBeforeTimeChecked.value,
      "reminderAfter": isReminderAfterTimeChecked.value,
    };

    // TODO: Post this data to your backend API
    print("Collected Data: $data");
  }
}
