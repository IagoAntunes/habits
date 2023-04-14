import 'package:flutter/material.dart';
import 'package:habits/src/features/newTask/newTask_page.dart';
import 'package:habits/src/models/month_model.dart';
import 'package:habits/src/models/task_model.dart';

import '../../../core/colors/colors.dart';

class DayTasksPage extends StatefulWidget {
  DayTasksPage({
    super.key,
    required this.index,
    required this.month,
  });
  MonthModel month;
  int index;
  @override
  State<DayTasksPage> createState() => _DayTasksPageState();
}

class _DayTasksPageState extends State<DayTasksPage> {
  List<TaskModel> listTask = [];
  @override
  void initState() {
    super.initState();

    for (var task in widget.month.list) {
      if (task.date.day == widget.index + 1) {
        listTask.add(task);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'terça-feira',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.greyLight,
              ),
            ),
            Text(
              '${(widget.index + 1).toString().padLeft(2, '0')}/${widget.month.id.toString().padLeft(2, '0')}',
              style: TextStyle(
                fontSize: 36,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            LinearProgressIndicator(
                minHeight: 10,
                color: AppColors.purple3,
                backgroundColor: AppColors.greymed,
                value: listTask.isEmpty
                    ? 0
                    : (((listTask)
                                    .where(
                                        (element) => element.isFinished == true)
                                    .length *
                                100) /
                            listTask.length) /
                        100),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: listTask.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    Transform.scale(
                      scale: 1.6,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: listTask[index].isFinished,
                        onChanged: (value) {},
                        checkColor: AppColors.white,
                        activeColor: AppColors.green,
                      ),
                    ),
                    const Text(
                      "Recieve Mail",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.purple3,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewTaskPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
