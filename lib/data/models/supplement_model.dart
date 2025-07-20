class SupplementModel {
  final String name;
  final String? form;
  final int dosageTimes;
  final int dosageAmount;
  final String frequency;
  final String duration;
  final String meal;
  final String timeOfDay;
  final bool reminderBefore;
  final bool reminderAfter;
  final String customTime;
  final DateTime createdAt;

  SupplementModel({
    required this.name,
    required this.form,
    required this.dosageTimes,
    required this.dosageAmount,
    required this.frequency,
    required this.duration,
    required this.meal,
    required this.timeOfDay,
    required this.reminderBefore,
    required this.reminderAfter,
    required this.customTime,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "form": form,
      "dosageTimes": dosageTimes,
      "dosageAmount": dosageAmount,
      "frequency": frequency,
      "duration": duration,
      "meal": meal,
      "timeOfDay": timeOfDay,
      "reminderBefore": reminderBefore,
      "reminderAfter": reminderAfter,
      "customTime": customTime,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
