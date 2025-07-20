import 'package:get/get.dart';
import 'package:onelook/data/models/activity_model.dart';
import 'package:onelook/data/repository/activity_repository.dart';
import 'package:onelook/data/repository/auth_repository.dart';

class AddActivityController extends GetxController {
  final _repo = ActivityRepository();
  
  final isReminderBeforeTimeChecked = false.obs;
  final isReminderAfterTimeChecked = false.obs;

  final selectedFormIndex = (-1).obs;
  final selectedTimeOption = ''.obs;
  final isCustomTimeSelected = false.obs;

  final customHour = 0.obs;
  final customMinute = 0.obs;

  final durationHour = 0.obs;
  final durationMinute = 0.obs;

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

  void submitActivity() async {
  if (selectedFormIndex.value < 0 || selectedTimeOption.value.isEmpty) {
    Get.snackbar("Error", "Please select an activity and time.");
    return;
  }

  final activitydata = ActivityModel(
    form: activity[selectedFormIndex.value]["label"]!,
    timeOfDay: selectedTimeOption.value,
    customTime: customTimeFormatted,
    duration: "${durationHour.value}h ${durationMinute.value}m",
    reminderBefore: isReminderBeforeTimeChecked.value,
    reminderAfter: isReminderAfterTimeChecked.value,
    createdAt: DateTime.now(),
  );

  try {
    final userId = Get.find<AuthRepository>().currentUserId;
    if (userId != null) {
      await _repo.addActivity(userId, activitydata);
      Get.back();
      Get.snackbar("Success", "Activity added successfully");
    } else {
      Get.snackbar("Error", "User not authenticated");
    }
  } catch (e) {
    Get.snackbar("Error", "Failed to save activity: $e");
  }
}
}
