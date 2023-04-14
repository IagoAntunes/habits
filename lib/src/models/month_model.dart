// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:habits/src/models/task_model.dart';

class MonthModel {
  int id;
  String name;
  int days;
  List<TaskModel> list;
  MonthModel({
    required this.id,
    required this.name,
    required this.days,
    required this.list,
  });
}
