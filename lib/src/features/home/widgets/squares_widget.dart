import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';

class SquaresLine extends StatelessWidget {
  const SquaresLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
