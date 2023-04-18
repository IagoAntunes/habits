import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits/core/colors/colors.dart';
import 'package:habits/core/months/months.dart';
import 'package:habits/core/widgets/new_task_button.dart';
import 'package:habits/src/features/dayTasks/day_tasks_page.dart';
import 'package:habits/src/models/month_model.dart';
import 'package:habits/src/models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MonthModel month;
  List<TaskModel> listTask = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    int currentMonth = DateTime.now().month;
    month = listMonths.where((element) => element.id == currentMonth).first;
    _getData();
  }

  _getData() async {
    var snapshot = await firestore.collection('habits').get();
    listTask = [];
    month.list = [];
    for (var doc in snapshot.docs) {
      listTask.add(TaskModel.fromMap(doc.data()));
    }

    for (var task in listTask) {
      if (task.date.month == month.id) {
        month.list.add(task);
      }
    }
    return true;
  }

  Color _frequencyBorderColor(int index) {
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

  Color _frequencyBackgroundColor(int index) {
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

  List<TaskModel> getDaysFilter(int index) {
    List<TaskModel> listAux = [];
    for (var task in month.list) {
      if (task.date.day == index + 1) {
        listAux.add(task);
      }
    }
    return listAux;
  }

  List<TaskModel> getDaysFilterCurrent() {
    List<TaskModel> listAux = [];
    for (var task in month.list) {
      if (task.date.day == DateTime.now().day) {
        listAux.add(task);
      }
    }
    return listAux;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.greyDark,
                      border: Border.all(
                        width: 1,
                        color: AppColors.greymed,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.purple1,
                      border: Border.all(
                        width: 1,
                        color: AppColors.purpleb1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.purple2,
                      border: Border.all(
                        width: 1,
                        color: AppColors.purpleb2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.purple3,
                      border: Border.all(
                        width: 1,
                        color: AppColors.purpleb3,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.purple4,
                      border: Border.all(
                        width: 1,
                        color: AppColors.purpleb4,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.purple5,
                      border: Border.all(
                        width: 1,
                        color: AppColors.purpleb5,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'habits',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    NewTaskButtonWidget(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DayTasksPage(
                            day: DateTime.now().day,
                            month: month,
                            listTask: getDaysFilterCurrent(),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              FutureBuilder(
                  future: _getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: GridView.count(
                          crossAxisCount: 5,
                          children: List.generate(month.days, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DayTasksPage(
                                        day: index,
                                        month: month,
                                        listTask: getDaysFilter(index),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: _frequencyBackgroundColor(index),
                                    border: Border.all(
                                      width: 3,
                                      color: _frequencyBorderColor(index),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
