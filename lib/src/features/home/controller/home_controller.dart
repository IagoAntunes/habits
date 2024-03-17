import 'package:flutter/material.dart';
import 'package:habits/src/models/month_model.dart';

import '../../../../core/colors/colors.dart';
import '../../../models/habit_model.dart';

class HomeController {
  Color frequencyBorderColor(int index, MonthModel month) {
    var listDay = month.list.where((element) => element.date.day == index + 1);
    if (listDay.isEmpty) {
      return AppColors.greymed;
    } else {
      if (listDay.where((element) => element.isFinished == true).length == 1) {
        return AppColors.purpleb1;
      } else if (listDay
              .where((element) => element.isFinished == true)
              .length ==
          2) {
        return AppColors.purpleb2;
      } else if (listDay
              .where((element) => element.isFinished == true)
              .length ==
          3) {
        return AppColors.purpleb3;
      } else if (listDay
              .where((element) => element.isFinished == true)
              .length ==
          4) {
        return AppColors.purpleb4;
      } else {
        return AppColors.purpleb5;
      }
    }
  }

  Color frequencyBackgroundColor(int index, MonthModel month) {
    var listDay = month.list.where((element) => element.date.day == index + 1);
    if (listDay.isEmpty) {
      return AppColors.greyDark;
    } else {
      if (listDay.where((element) => element.isFinished == true).length == 1) {
        return AppColors.purple1;
      } else if (listDay
              .where((element) => element.isFinished == true)
              .length ==
          2) {
        return AppColors.purple2;
      } else if (listDay
              .where((element) => element.isFinished == true)
              .length ==
          3) {
        return AppColors.purple3;
      } else if (listDay
              .where((element) => element.isFinished == true)
              .length ==
          4) {
        return AppColors.purple4;
      } else {
        return AppColors.purple5;
      }
    }
  }

  List<HabitModel> getDaysFilter(int index, MonthModel month) {
    List<HabitModel> listAux = [];
    for (var task in month.list) {
      if (task.date.day == index + 1) {
        listAux.add(task);
      }
    }
    return listAux;
  }

  List<HabitModel> getDaysFilterCurrent(MonthModel month) {
    List<HabitModel> listAux = [];
    for (var task in month.list) {
      if (task.date.day == DateTime(2023, 1, 5, 14, 30, 0).day) {
        listAux.add(task);
      }
    }
    return listAux;
  }
}
