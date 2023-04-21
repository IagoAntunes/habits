import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';
import '../../../models/habit_model.dart';

class ProgressIndicadorWidget extends StatelessWidget {
  const ProgressIndicadorWidget({
    super.key,
    required this.listTask,
  });
  final List<HabitModel> listTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greymed,
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
