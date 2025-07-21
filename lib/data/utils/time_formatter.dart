class TimeFormatter {
  static String toAmPm(int hour, int minute) {
    final isAm = hour < 12;
    final formattedHour = (hour % 12 == 0 ? 12 : hour % 12).toString().padLeft(2, '0');
    final formattedMinute = minute.toString().padLeft(2, '0');
    return "$formattedHour:$formattedMinute ${isAm ? 'AM' : 'PM'}";
  }
}
