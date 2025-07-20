class ActivityModel {
  final String form;
  final String timeOfDay;
  final String customTime;
  final String duration;
  final bool reminderBefore;
  final bool reminderAfter;
  final DateTime createdAt;

  ActivityModel({
    required this.form,
    required this.timeOfDay,
    required this.customTime,
    required this.duration,
    required this.reminderBefore,
    required this.reminderAfter,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "form": form,
      "timeOfDay": timeOfDay,
      "customTime": customTime,
      "duration": duration,
      "reminderBefore": reminderBefore,
      "reminderAfter": reminderAfter,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
