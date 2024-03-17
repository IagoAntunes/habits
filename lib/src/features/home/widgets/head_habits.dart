import 'package:flutter/material.dart';

import '../../../../core/widgets/new_task_button.dart';
import '../../../models/month_model.dart';
import '../../dayTasks/day_tasks_page.dart';
import '../controller/home_controller.dart';

class HeadHabits extends StatelessWidget {
  const HeadHabits({
    Key? key,
    required this.month,
    required this.homeController,
  }) : super(key: key);

  final MonthModel month;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  day: DateTime(2023, 1, 5, 14, 30, 0).day,
                  month: month,
                  listTask: homeController.getDaysFilterCurrent(month),
                  isNew: true,
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
