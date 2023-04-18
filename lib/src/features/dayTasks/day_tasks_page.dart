import 'package:flutter/material.dart';
import 'package:habits/src/features/dayTasks/widgets/progress_widget.dart';
import 'package:habits/src/features/newTask/newTask_page.dart';
import 'package:habits/src/models/month_model.dart';
import 'package:habits/src/models/task_model.dart';

import '../../../core/colors/colors.dart';

class DayTasksPage extends StatefulWidget {
  const DayTasksPage({
    super.key,
    required this.month,
    required this.day,
    required this.listTask,
  });
  final int day;
  final MonthModel month;
  final List<TaskModel> listTask;
  @override
  State<DayTasksPage> createState() => _DayTasksPageState();
}

class _DayTasksPageState extends State<DayTasksPage> {
  @override
  void initState() {
    super.initState();
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
              '${(widget.day + 1).toString().padLeft(2, '0')}/${widget.month.id.toString().padLeft(2, '0')}',
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
              child: ListView.builder(
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
                        onChanged: (value) {
                          setState(() {
                            widget.listTask[index].isFinished =
                                !widget.listTask[index].isFinished;
                          });
                        },
                        checkColor: AppColors.white,
                        activeColor: AppColors.green,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.purple3,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewTaskPage(),
            ),
          ).then((value) {
            if (value != null) {
              widget.listTask.add(value);
              setState(() {});
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
