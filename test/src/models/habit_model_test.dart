import 'package:flutter_test/flutter_test.dart';
import 'package:habits/src/models/habit_model.dart';

void main() {
  HabitModel correctModel = HabitModel(
    id: 'abc123',
    description: 'study',
    date: DateTime(2023, 1, 5, 14, 30, 0),
    isFinished: true,
  );
  Map<String, dynamic> map = {
    'id': 'abc123',
    'description': 'study',
    'date': DateTime(2023, 1, 5, 14, 30, 0),
    'isFinished': true,
  };
  test('Testing on the model should succeed', (() {
    expect(correctModel, isA<HabitModel>());
    expect(correctModel.toMap(), map);
    expect(HabitModel.fromMap(map), isA<HabitModel>());
    expect(correctModel.toJson(), isA<String>());
    expect(HabitModel.fromJson(correctModel.toJson()), isA<HabitModel>());
  }));
}
