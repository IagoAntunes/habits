import 'package:flutter_test/flutter_test.dart';
import 'package:habits/src/models/month_model.dart';

void main() {
  MonthModel monthModel =
      MonthModel(id: 1, name: 'January', days: 31, list: []);
  test('Basic tests in MonthModel', (() {
    expect(monthModel, isA<MonthModel>());
    expect(monthModel.list, List.empty());
  }));
}
