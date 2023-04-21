import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';

class DaysWeekWidget extends StatelessWidget {
  const DaysWeekWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "S",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.greyLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "M",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.greyLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "T",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.greyLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "W",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.greyLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "T",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.greyLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "F",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.greyLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "S",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.greyLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
