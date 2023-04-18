import 'package:flutter/material.dart';
import 'package:habits/src/models/task_model.dart';

import '../../../../core/colors/colors.dart';

class ProgressIndicadorWidget extends StatelessWidget {
  ProgressIndicadorWidget({
    super.key,
    required this.listTask,
  });
  List<TaskModel> listTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: AnimatedFractionallySizedBox(
        duration: const Duration(seconds: 1),
        alignment: Alignment.centerLeft,
        widthFactor: listTask.isEmpty
            ? 0
            : (((listTask)
                            .where((element) => element.isFinished == true)
                            .length *
                        100) /
                    listTask.length) /
                100,
        child: Container(
          height: 15,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            color: AppColors.purple3,
          ),
        ),
      ),
    );
  }
}
