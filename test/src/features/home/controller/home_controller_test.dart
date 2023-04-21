import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habits/src/features/home/controller/home_controller.dart';
import 'package:habits/src/models/habit_model.dart';
import 'package:habits/src/models/month_model.dart';

void main() {
  HomeController homeController = HomeController();
  HabitModel habit = HabitModel(
    id: 'abc123',
    description: 'study',
    date: DateTime(2023, 5, 18),
    isFinished: true,
  );
  MonthModel month = MonthModel(id: 2, name: 'March', days: 31, list: []);
  test('Return tests background colors', (() {
    expect(
      const Color(0xff18181B),
      homeController.frequencyBackgroundColor(17, month),
    );
    month.list.add(habit);
    expect(
      const Color(0xff4C1D95),
      homeController.frequencyBackgroundColor(17, month),
    );
    month.list.add(habit);
    expect(
      const Color(0xff5B21B6),
      homeController.frequencyBackgroundColor(17, month),
    );
    month.list.add(habit);
    expect(
      const Color(0xff6D28D9),
      homeController.frequencyBackgroundColor(17, month),
    );
    month.list.add(habit);
    expect(
      const Color(0xff7C3AED),
      homeController.frequencyBackgroundColor(17, month),
    );
    month.list.add(habit);
    expect(
      const Color(0xff8B5CF6),
      homeController.frequencyBackgroundColor(17, month),
    );
  }));
  month.list = [];
  test('color return tests', (() {
    expect(
      const Color(0xff27272A),
      homeController.frequencyBorderColor(17, month),
    );
    month.list.add(habit);
    expect(
      const Color(0xff6D28D9),
      homeController.frequencyBorderColor(17, month),
    );
    month.list.add(habit);
    expect(
      const Color(0xff7C3AED),
      homeController.frequencyBorderColor(17, month),
    );
    month.list.add(habit);
    expect(
      const Color(0xff8B5CF6),
      homeController.frequencyBorderColor(17, month),
    );
    month.list.add(habit);
    expect(
      const Color(0xffA78BFA),
      homeController.frequencyBorderColor(17, month),
    );
    month.list.add(habit);
    expect(
      const Color(0xffC4B5FD),
      homeController.frequencyBorderColor(17, month),
    );
  }));

  test('Return test filter list habits on the day', (() {
    month.list.add(habit);
    month.list.add(habit);
    List<HabitModel> expectList = homeController.getDaysFilter(17, month);
    expect(expectList, isA<List<HabitModel>>());
    expect(expectList.length, 2);
  }));

  test('Test return filter list current date', (() {
    List<HabitModel> expectList = homeController.getDaysFilterCurrent(month);
    expect(expectList, isA<List<HabitModel>>());
    expect(expectList.length, 0);
  }));
}
