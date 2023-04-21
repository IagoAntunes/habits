import 'package:flutter_test/flutter_test.dart';
import 'package:habits/src/features/dayTasks/controller/day_tasks_controller.dart';

void main() {
  test('Return test weekday name', (() {
    DayTasksController dayTasksController = DayTasksController();

    String nameDay = dayTasksController.getNameDay(2023, 4, 18);
    expect(nameDay, 'Tuesday');
  }));
}
