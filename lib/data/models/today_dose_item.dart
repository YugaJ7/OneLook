class TodayDoseItem {
  final String docId;
  final String name;
  final String form;
  final String meal;
  final int amount;
  final bool? reminderBefore; 
  final bool? reminderAfter; 
  final int doseIndex;
  final String time;
  bool isChecked; 
  final int dayIndex;

  TodayDoseItem({
    required this.docId,
    required this.name,
    required this.form,
    required this.meal,
    required this.amount,
    this.reminderBefore,
    this.reminderAfter,
    required this.doseIndex,
    required this.time,
    required this.isChecked,
    required this.dayIndex,
  });
}