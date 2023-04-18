class DayTasksController {
  String getNameDay(int year, int month, int day) {
    DateTime(2023, month, day);
    int dayweek = DateTime(2023, month, day).weekday;
    String dayOfWeekName = '';
    if (dayweek == 1) {
      dayOfWeekName = 'Monday';
    } else if (dayweek == 2) {
      dayOfWeekName = 'Tuesday';
    } else if (dayweek == 3) {
      dayOfWeekName = 'Wednesday';
    } else if (dayweek == 4) {
      dayOfWeekName = 'Thursday';
    } else if (dayweek == 5) {
      dayOfWeekName = 'Friday';
    } else if (dayweek == 6) {
      dayOfWeekName = 'Saturday';
    } else if (dayweek == 7) {
      dayOfWeekName = 'Sunday';
    }
    return dayOfWeekName;
  }
}
