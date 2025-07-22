DateTime parseTime(String timeString) {
  final now = DateTime.now();
  final parts = timeString.split(RegExp(r'[: ]'));

  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);
  final ampm = parts[2];

  if (ampm == 'PM' && hour < 12) {
    hour += 12;
  } else if (ampm == 'AM' && hour == 12) {
    hour = 0;
  }
  return DateTime(now.year, now.month, now.day, hour, minute);
}
