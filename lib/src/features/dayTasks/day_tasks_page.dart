import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits/src/features/dayTasks/widgets/progress_widget.dart';
import 'package:habits/src/features/newTask/new_task_page.dart';
import 'package:habits/src/models/month_model.dart';

import '../../../core/colors/colors.dart';
import '../../models/habit_model.dart';
import 'controller/day_tasks_controller.dart';

class DayTasksPage extends StatefulWidget {
  const DayTasksPage({
    super.key,
    required this.month,
    required this.day,
    required this.listTask,
    this.isNew = false,
  });
  final int day;
  final MonthModel month;
  final List<HabitModel> listTask;
  final bool isNew;
  @override
  State<DayTasksPage> createState() => _DayTasksPageState();
}

class _DayTasksPageState extends State<DayTasksPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DayTasksController controller = DayTasksController();
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
              controller.getNameDay(DateTime(2023, 1, 5, 14, 30, 0).year,
                  widget.month.id, widget.day),
              style: TextStyle(
                fontSize: 16,
                color: AppColors.greyLight,
              ),
            ),
            Text(
              '${(widget.isNew ? widget.day : widget.day + 1).toString().padLeft(2, '0')}/${widget.month.id.toString().padLeft(2, '0')}',
              style: TextStyle(
                fontSize: 36,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            ProgressIndicadorWidget(listTask: widget.listTask),
            const SizedBox(height: 20),
            Expanded(
              child: widget.listTask.isEmpty
                  ? Text(
                      "You are not tracking any habits yet, start by registering one.",
                      style:
                          TextStyle(color: AppColors.greyLight, fontSize: 16),
                    )
                  : ListView.builder(
                      itemCount: widget.listTask.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Transform.scale(
                            scale: 1.6,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              value: widget.listTask[index].isFinished,
                              onChanged: (value) async {
                                await firestore
                                    .collection('habits')
                                    .doc(widget.listTask[index].id)
                                    .update({
                                  'isFinished':
                                      !widget.listTask[index].isFinished
                                });
                                setState(() {
                                  widget.listTask[index].isFinished =
                                      !widget.listTask[index].isFinished;
                                });
                              },
                              checkColor: AppColors.white,
                              activeColor: AppColors.green,
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (widget.listTask[index].isFinished) {
                                    return AppColors.green;
                                  }
                                  return AppColors.greyLight;
                                },
                              ),
                            ),
                          ),
                          Text(
                            widget.listTask[index].description,
                            style: const TextStyle(
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
      floatingActionButton: (widget.isNew ? widget.day : widget.day + 1) ==
                  DateTime(2023, 1, 5, 14, 30, 0).day &&
              widget.month.id == DateTime(2023, 1, 5, 14, 30, 0).month
          ? FloatingActionButton(
              backgroundColor: AppColors.purple3,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewTaskPage(),
                  ),
                ).then(
                  (value) {
                    if (value != null) {
                      setState(() {
                        widget.listTask.add(value);
                      });
                    }
                  },
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
