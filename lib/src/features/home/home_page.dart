import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits/core/colors/colors.dart';
import 'package:habits/core/months/months.dart';
import 'package:habits/src/features/dayTasks/day_tasks_page.dart';
import 'package:habits/src/features/home/controller/home_controller.dart';
import 'package:habits/src/features/home/widgets/days_week_widget.dart';
import 'package:habits/src/features/home/widgets/head_habits.dart';
import 'package:habits/src/features/home/widgets/squares_widget.dart';
import 'package:habits/src/models/month_model.dart';
import 'package:habits/src/models/habit_model.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MonthModel month;
  List<HabitModel> listTask = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late StreamSubscription listener;
  HomeController homeController = HomeController();
  @override
  void initState() {
    super.initState();
    month = listMonths
        .where((element) => element.id == DateTime(2023, 1, 5, 14, 30, 0).month)
        .first;
    addListeners();
  }

  @override
  void dispose() {
    super.dispose();
    listener.cancel();
  }

  _getData() async {
    var snapshot = await firestore.collection('habits').get();
    listTask = [];
    month.list = [];
    for (var doc in snapshot.docs) {
      listTask.add(HabitModel.fromMap(doc.data()));
    }

    for (var task in listTask) {
      if (task.date.month == month.id) {
        month.list.add(task);
      }
    }
    setState(() {});
    return true;
  }

  void addListeners() async {
    listener = firestore.collection('habits').snapshots().listen((snapshot) {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SquaresLine(),
              HeadHabits(month: month, homeController: homeController),
              const SizedBox(height: 30),
              const DaysWeekWidget(),
              FutureBuilder(
                future: _getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: GridView.count(
                        crossAxisCount: 7,
                        children: List.generate(month.days, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DayTasksPage(
                                      day: index,
                                      month: month,
                                      listTask: homeController.getDaysFilter(
                                          index, month),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: homeController
                                      .frequencyBackgroundColor(index, month),
                                  border: Border.all(
                                    width: index + 1 ==
                                            DateTime(2023, 1, 5, 14, 30, 0)
                                                    .day +
                                                2
                                        ? 5
                                        : 3,
                                    color: index + 1 ==
                                            DateTime(2023, 1, 5, 14, 30, 0).day
                                        ? Colors.white
                                        : homeController.frequencyBorderColor(
                                            index, month),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: GridView.count(
                        crossAxisCount: 7,
                        children: List.generate(month.days, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Shimmer.fromColors(
                              baseColor: AppColors.greyDark,
                              highlightColor:
                                  AppColors.greyDark.withOpacity(0.3),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: homeController
                                      .frequencyBackgroundColor(index, month),
                                  border: Border.all(
                                    width: index + 1 ==
                                            DateTime(2023, 1, 5, 14, 30, 0)
                                                    .day +
                                                2
                                        ? 5
                                        : 3,
                                    color: index + 1 ==
                                            DateTime(2023, 1, 5, 14, 30, 0).day
                                        ? Colors.white
                                        : homeController.frequencyBorderColor(
                                            index, month),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
