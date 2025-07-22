class SupplementModel {
  final String name;
  final String form;
  final int dosageAmount;
  final int dosageTimes;
  final String frequency;
  final int duration;
  final String meal;
  final List<String> timeOfDay;
  final bool reminderBefore;
  final bool reminderAfter;
  final List<Map<String, bool>> tracking;
  final DateTime createdAt;
  final DateTime endDate;

  SupplementModel({
    required this.name,
    required this.form,
    required this.dosageAmount,
    required this.dosageTimes,
    required this.frequency,
    required this.duration,
    required this.meal,
    required this.timeOfDay,
    required this.reminderBefore,
    required this.reminderAfter,
    required this.tracking,
    required this.createdAt,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'form': form,
      'dosageAmount': dosageAmount,
      'dosageTimes': dosageTimes,
      'frequency': frequency,
      'duration': duration,
      'meal': meal,
      'timeOfDay': timeOfDay,
      'reminderBefore': reminderBefore,
      'reminderAfter': reminderAfter,
      'tracking': tracking,
      'createdAt': createdAt.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }

  factory SupplementModel.fromMap(Map<String, dynamic> data) {
    return SupplementModel(
      name: data['name'],
      form: data['form'],
      dosageAmount: data['dosageAmount'],
      dosageTimes: data['dosageTimes'],
      frequency: data['frequency'],
      duration: data['duration'],
      meal: data['meal'],
      timeOfDay: List<String>.from(data['timeOfDay']),
      reminderBefore: data['reminderBefore'],
      reminderAfter: data['reminderAfter'],
      tracking: List<Map<String, bool>>.from(
        (data['tracking'] as List).map((e) => Map<String, bool>.from(e)),
      ),
      createdAt: DateTime.parse(data['createdAt']),
      endDate: DateTime.parse(data['endDate']),
    );
  }
}
