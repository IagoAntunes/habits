import 'package:flutter_test/flutter_test.dart';
import 'package:habits/src/models/habit_model.dart';

void main() {
  HabitModel correctModel = HabitModel(
    id: 'abc123',
    description: 'study',
    date: DateTime.now(),
    isFinished: true,
  );
  Map<String, dynamic> map = {
    'id': 'abc123',
    'description': 'study',
    'date': DateTime.now().millisecondsSinceEpoch,
    'isFinished': true,
  };
  test('Teste no model devem ocorrer com sucesso', (() {
    expect(correctModel, isA<HabitModel>());
    expect(correctModel.toMap(), map);
    expect(HabitModel.fromMap(map), isA<HabitModel>());
    expect(correctModel.toJson(), isA<String>());
    expect(HabitModel.fromJson(correctModel.toJson()), isA<HabitModel>());
  }));
}
