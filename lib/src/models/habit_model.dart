import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HabitModel {
  String id;
  String description;
  DateTime date;
  bool isFinished;
  HabitModel({
    required this.id,
    required this.description,
    required this.date,
    required this.isFinished,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'isFinished': isFinished,
    };
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map['id'] as String,
      description: map['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      isFinished: map['isFinished'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitModel.fromJson(String source) =>
      HabitModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
