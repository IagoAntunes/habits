import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habits/core/colors/colors.dart';
import 'package:habits/src/features/home/controller/home_controller.dart';
import 'package:habits/src/models/habit_model.dart';
import 'package:habits/src/models/month_model.dart';

void main() {
  HomeController homeController = HomeController();

  MonthModel month = MonthModel(id: 2, name: 'March', days: 31, list: [
    HabitModel(
      id: 'abc123',
      description: 'study',
      date: DateTime(2023, 5, 18),
      isFinished: true,
    ),
  ]);
  test('Testes metodos controller', (() {
    expect(
      Color(0xff27272A),
      homeController.frequencyBackgroundColor(17, month),
    );
  }));
}
